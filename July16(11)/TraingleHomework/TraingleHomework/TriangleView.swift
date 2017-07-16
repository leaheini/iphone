//
//  TriangleView.swift
//  TraingleHomework
//
//  Created by hackeru on 16/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

@IBDesignable class TriangleView: UIView {

    @IBInspectable var frameColor : UIColor = .orange{
        didSet{
            //refresh
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var fillColor : UIColor = .purple{
        didSet{
            //refresh
            setNeedsDisplay()
        }
    }
    
    private var _lineWidth : CGFloat = 1
    @IBInspectable var lineWidth : CGFloat{
        get{
            return _lineWidth
        }
        set{
            guard newValue >= 0 && newValue <= 10 else {
                return
            }
            
            _lineWidth = newValue
            
            //refresh
            setNeedsDisplay()
        }
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        
        let w = bounds.width
        let h = bounds.height
        
        context.move(to: CGPoint(x: w * 0.5, y: h * 0.1))
        context.addLine(to: CGPoint(x: w * 0.1, y: h * 0.9))
        context.addLine(to: CGPoint(x: w * 0.9, y: h * 0.9))
        context.closePath()
        
        //context.setStrokeColor(frameColor.cgColor)
        frameColor.setStroke()
        fillColor.setFill()
        context.setLineWidth(lineWidth)
        
        context.drawPath(using: .fillStroke)   // fill + stroke
        
    }
   

}
