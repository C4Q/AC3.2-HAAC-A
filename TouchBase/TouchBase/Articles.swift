//
//  Articles.swift
//  TouchBase
//
//  Created by Cris on 12/1/16.
//  Copyright © 2016 Cris. All rights reserved.
//

import Foundation
import SwiftyJSON


class Articles {
    
    let author: String
    let title: String
    let description: String
    let url: String
    let articleImageUrl: String
    let publishedDate: String
    
    init(author: String, title: String, description: String, url: String, articleImageUrl: String, publishedDate: String){
        self.author = author
        self.title = title
        self.description = description
        self.url = url
        self.articleImageUrl = articleImageUrl
        self.publishedDate = publishedDate
    }
    
}
