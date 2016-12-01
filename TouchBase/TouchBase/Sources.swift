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
    
    
    
}

