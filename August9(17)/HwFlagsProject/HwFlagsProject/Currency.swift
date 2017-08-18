//
//  Currency.swift
//  HwFlagsProject
//
//  Created by hackeru on 09/08/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class Currency: NSObject {
    let code : String    // to the name of the state
    let value : Double   // to the currency money
    
    var image : UIImage?{
        get{
            return UIImage(named: code.lowercased())  // search auto the state name on assets
        }
    }
    
    init(code : String, value : Double) {
        self.code = code
        self.value = value
        
        super.init()
    }
    
    
}
