//
//  MyView.swift
//  DrawProject
//
//  Created by hackeru on 12/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class MyView: UIView {
    
    var lineWidth : CGFloat = 6{
        didSet{
            //refresh draw
            self.setNeedsDisplay()
        }
    }
    
    //from stroryboard
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    //from code
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    private func setup(){
        self.backgroundColor = .white
    }
    
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        let context = UIGraphicsGetCurrentContext()
        
        // explain the direction to draw
        let w = bounds.width
        let h = bounds.height
        
        // lets draw meshulash
        context?.move(to: CGPoint(x: w * 0.5, y: h * 0.1))   //from
        context?.addLine(to: CGPoint(x: w * 0.1, y: h * 0.8))  //to
        context?.addLine(to: CGPoint(x: w * 0.9, y: h * 0.8))
        context?.closePath()
        
        UIColor.red.setStroke()     // color the line
        //context?.setStrokeColor(UIColor.purple.cgColor)     //or
        
        context?.setLineWidth(lineWidth)   // the default width 1
        
        UIColor.purple.setFill()      //fill
        
        //----- draw the misgeret ------
        // 1.     context?.strokePath()
        // 2.     context?.fillPath()
        context?.drawPath(using: .fillStroke)  //instead of two above
        
    }
    
    
}
