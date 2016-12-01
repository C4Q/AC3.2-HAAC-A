//
//  APIManager.swift
//  TouchBase
//
//  Created by Cris on 12/1/16.
//  Copyright © 2016 Cris. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class APIManager {
   static let shared = APIManager()
    private init() {}
    
    func makeRequest(url: String = "https://newsapi.org/v1/sources?language=en", callback: @escaping ([Sources]?) -> Void) {
        
        var sources: [Sources] = []
        
        guard let url = URL(string: url) else { return }
        
        
        Alamofire.request(url).validate().responseJSON { (response) in
            guard let rawData = response.result.value else { return }
            let json = JSON(rawData)
            guard let sourcesArray = json["sources"].array else { return }
            
            for source in sourcesArray {
                if let id = source["id"].string,
                    let name = source["name"].string,
                    let logos = source["urlsToLogos"].dictionaryObject {
                    let logosDict = Logos(from: logos)
                    let sourceinfo = Sources(sourceID: id, name: name, sourceLogos: logosDict!)
                    sources.append(sourceinfo)
                }
            }
            callback(sources)
        }.resume()
    }
}
