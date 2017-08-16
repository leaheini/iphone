//
//  Utils.swift
//  chat
//
//  Created by Benny Davidovitz on 16/08/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

extension UIColor{
    static var randomColor : UIColor{
        get{
            let redValue = CGFloat(arc4random_uniform(256)) / 255
            let blueValue = CGFloat(arc4random_uniform(256)) / 255
            let greenValue = CGFloat(arc4random_uniform(256)) / 255
            
            return UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1)
        }
    }
}

extension Date{
    var toString : String{
        get{
            let formatter = DateFormatter()
            formatter.dateStyle = .medium
            formatter.timeStyle = .medium
            formatter.doesRelativeDateFormatting = true
            
            return formatter.string(from: self)
        }
    }
    
    var timeString : String{
        get{
            let formatter = DateFormatter()
            formatter.dateFormat = "HH:mm"
            
            return formatter.string(from: self)
        }
    }
}












