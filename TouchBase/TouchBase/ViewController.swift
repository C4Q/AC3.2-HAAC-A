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
    override func viewDidLoad() {
        super.viewDidLoad()
        getsources()
    }
    
    func getsources() {
       APIManager.shared.makeRequest { (sources) in
            print(sources![0].name)
        }
    }



}

