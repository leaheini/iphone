//
//  ColorBezierPath.swift
//  DrawSomething
//
//  Created by hackeru on 16/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class ColorBezierPath: UIBezierPath {
    var strokeColor : UIColor?
    
    override func stroke() {
        if let strokeColor = strokeColor{
            strokeColor.setStroke()
        }
        
        super.stroke()
    }
}
