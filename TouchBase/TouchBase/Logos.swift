//
//  Logos.swift
//  TouchBase
//
//  Created by Cris on 12/1/16.
//  Copyright © 2016 Cris. All rights reserved.
//

import Foundation

class Logos {
    let smallLogo: String
    let mediumLogo: String
    let largeLogo: String
    
    init(smallLogo: String, mediumLogo: String, largeLogo: String){
        self.smallLogo = smallLogo
        self.mediumLogo = mediumLogo
        self.largeLogo = largeLogo
    }
    
    convenience init?(from dict: [String: Any]){
        guard let smallLogo = dict["small"] as? String else { return nil }
        guard let medLogo = dict["medium"] as? String else { return nil }
        guard let largeLogo = dict["large"] as? String else { return nil }
        
        self.init(smallLogo: smallLogo, mediumLogo: medLogo, largeLogo: largeLogo)
    }

}
