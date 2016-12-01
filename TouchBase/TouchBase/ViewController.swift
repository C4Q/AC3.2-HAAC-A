//
//  ViewController.swift
//  TouchBase
//
//  Created by Cris on 12/1/16.
//  Copyright © 2016 Cris. All rights reserved.
//

import UIKit
import ASCollectionView

<<<<<<< HEAD
class ViewController: UIViewController {
    var sources: [Sources] = []
    var articles: [Articles] = []
=======
class ViewController: UIViewController, ASCollectionViewDataSource, ASCollectionViewDelegate  {
    var newsSources: [Sources] = []
    
>>>>>>> 2553f7ac67ecbb50a68d45724d44f3cd2c106d68
    override func viewDidLoad() {
        super.viewDidLoad()
        getsources()
        getArticles()
    }
    
    func getsources() {
<<<<<<< HEAD
       APIManager.shared.makeSourceRequest { (sources) in
            print(sources![0].name)
        }
    }
    
    func getArticles() {
        APIManager.shared.makeArticleRequest(source: "the-next-web") { (articles) in
            print(articles![0].title)
        }
    }
=======
        APIManager.shared.makeRequest { (sources) in
            if let validSources = sources {
                self.newsSources = validSources
            }
        }
    }
    func downloadImageFrom(urlString: String, completion: @escaping (_ image: UIImage?) -> Void) {
        guard let url = URL(string: urlString) else { return }
        let session = URLSession(configuration: .default)
        session.dataTask(with: url) { (data, response, error) in
            guard let validData = data, let image = UIImage(data: validData) else {
                //                print(error?.localizedDescription)
                completion(nil)
                
                return
            }
            DispatchQueue.main.async {
                completion(image)
            }
        }
    }
    
>>>>>>> 2553f7ac67ecbb50a68d45724d44f3cd2c106d68

    
    // MARK: ASCollectionViewDataSource
    
    func numberOfItemsInASCollectionView(_ asCollectionView: ASCollectionView) -> Int {
        return sources.count
    }
    
    func collectionView(asCollectionView: ASCollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let gridCell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! GridCell
        let news = sources[indexPath.row]
        let imageURL = news.sourceLogos.mediumLogo
//        gridCell.label.text = NSString(format: "Item %ld ", indexPath.row) as String
        downloadImageFrom(urlString: imageURL) {(image: UIImage?) in
        gridCell.imageView.image = image
        return gridCell
    }
    
    func collectionView(asCollectionView: ASCollectionView, parallaxCellForItemAtIndexPath indexPath: NSIndexPath) -> ASCollectionViewParallaxCell {
        let parallaxCell = collectionView.dequeueReusableCellWithReuseIdentifier("parallaxCell", forIndexPath: indexPath) as! ParallaxCell
        parallaxCell.label.text = NSString(format: "Item %ld ", indexPath.row) as String
        parallaxCell.updateParallaxImage(UIImage(named: NSString(format: "image-%ld", indexPath.row % 10) as String)!)
        return parallaxCell
    }
    
    func collectionView(asCollectionView: ASCollectionView, headerAtIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryViewOfKind(ASCollectionViewElement.Header, withReuseIdentifier: "header", forIndexPath: indexPath)
        return header
    }
    
    func loadMoreInASCollectionView(asCollectionView: ASCollectionView) {
        if numberOfItems > 30 {
            collectionView.enableLoadMore = false
            return
        }
        numberOfItems += 10
        collectionView.loadingMore = false
        collectionView.reloadData()
    }
    
}

