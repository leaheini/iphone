//
//  File.swift
//  GesturesProject
//
//  Created by hackeru on 05/07/2017.
//  Copyright © 2017 Leah. All rights reserved.
//

import UIKit

extension UIColor{
    static var randomColor : UIColor{
        get{
            //0..1
            let red : CGFloat = CGFloat(arc4random_uniform(256)) / 255
            let green : CGFloat = CGFloat(arc4random_uniform(256)) / 255
            let blue : CGFloat = CGFloat(arc4random_uniform(256)) / 255
            
            return UIColor(red: red, green: green, blue: blue, alpha: 1)

        }
    }
}
