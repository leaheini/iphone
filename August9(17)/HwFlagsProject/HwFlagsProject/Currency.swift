//
//  Currency.swift
//  HwFlagsProject
//
//  Created by hackeru on 09/08/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class Currency: NSObject {
    let code : String
    let value : Double
    
    var image : UIImage?{
        get{
            return UIImage(named: code.lowercased())
        }
    }
    
    init(code : String, value : Double) {
        self.code = code
        self.value = value
        
        super.init()
    }
    
    
}
