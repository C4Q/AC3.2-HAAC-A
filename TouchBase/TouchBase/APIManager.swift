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
    
    func makeSourceRequest(url: String = "https://newsapi.org/v1/sources?language=en", callback: @escaping ([Sources]?) -> Void) {
        
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
    
    func makeArticleEndPointURL(source: String) -> URL {
        let url = URL(string: "https://newsapi.org/v1/articles?source=the-next-web&sortBy=latest&apiKey=df4c5752e0f5490490473486e24881ef")
        
        return url!
    }
    
    func makeArticleRequest(source: String, callback: @escaping ([Articles]?) -> Void) {
        
        var articles: [Articles] = []
        
        let endPointUrl = makeArticleEndPointURL(source: source)
        
        
        Alamofire.request(endPointUrl).validate().responseJSON { (response) in
            guard let rawData = response.result.value else { return }
            let json = JSON(rawData)
            guard let articlesArray = json["articles"].array else { return }
            
            for article in articlesArray {
                if let author = article["author"].string,
                    let title = article["title"].string,
                    let description = article["description"].string {
                    let url = article["url"].string
                    let articleImageUrl = article["urlToImage"].string
                    let publishDate = article["publishedAt"].string
                    
                    let articleInfo = Articles(author: author, title: title, description: description, url: url!, articleImageUrl: articleImageUrl!, publishedDate: publishDate!)
                    articles.append(articleInfo)
                }
            }
            callback(articles)
            }.resume()
    }
}
