//
//  Sources.swift
//  TouchBase
//
//  Created by Cris on 12/1/16.
//  Copyright © 2016 Cris. All rights reserved.
//

import UIKit
import SwiftyJSON

class Sources {
    
    let sourceID: String
    let name: String
    let sourceLogos: Logos
    
    init(sourceID: String, name: String, sourceLogos: Logos) {
        self.sourceID = sourceID
        self.name = name
        self.sourceLogos = sourceLogos
    }
    
//    class func parsedData({
//        var sources: [Sources] = []
//        let json = JSON(data: sourceData)
//        let resultsArray = json["sources"].array
//        for i in 0..<resultsArray.count {
//            if let id = resultsArray[i]["id"].string,
//                let name = resultsArray[i]["name"].string,
//                let logos = resultsArray[i]["urlsToLogos"].dictionaryObject {
//                let logosDict = Logos(from: logos)
//                let sourceinfo = Sources(sourceID: id, name: name, sourceLogos: logosDict!)
//                sources.append(sourceinfo)
//            }
//        }
//        return sources
//    }
    
    
}

