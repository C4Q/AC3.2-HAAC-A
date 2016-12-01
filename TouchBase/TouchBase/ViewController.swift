//
//  ViewController.swift
//  TouchBase
//
//  Created by Cris on 12/1/16.
//  Copyright © 2016 Cris. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var sources: [Sources] = []
    var articles: [Articles] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        getsources()
        getArticles()
    }
    
    func getsources() {
       APIManager.shared.makeSourceRequest { (sources) in
            print(sources![0].name)
        }
    }
    
    func getArticles() {
        APIManager.shared.makeArticleRequest(source: "the-next-web") { (articles) in
            print(articles![0].title)
        }
    }



}

