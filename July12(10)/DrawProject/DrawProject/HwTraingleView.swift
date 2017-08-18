//
//  HwTraingleView.swift
//  DrawProject
//
//  Created by Leah  Eini on 15/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

@IBDesignable class HwTraingleView: UIView {

    private var _factor : CGFloat = 1

    @IBInspectable var lineWidth : CGFloat{
        set{
            guard newValue >= 1 && newValue <= 10 else {
                return
            }
            
            _factor = newValue
            //refresh
            setNeedsDisplay()
        }
        get{
            return _factor
        }
    }
    
    @IBInspectable var fillColor : UIColor = UIColor.green{
        didSet{
            //refresh draw
            self.setNeedsDisplay()
        }
    }
    
    @IBInspectable var lineColor : UIColor = UIColor.purple{
        didSet{
            //refresh
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
        
        // lets draw meshulash
        context.move(to: CGPoint(x: w * 0.5, y: h * 0.4))   //from
        context.addLine(to: CGPoint(x: w * 0.1, y: h * 0.8))  //to
        context.addLine(to: CGPoint(x: w * 0.9, y: h * 0.8))
        context.closePath()
        
        //UIColor.purple.setStroke()     // color the line
        context.setStrokeColor(lineColor.cgColor)
        
        context.setLineWidth(lineWidth)   // the default width 1
        
        //UIColor.purple.setFill()      //fill
        context.setFillColor(fillColor.cgColor)
        
        context.drawPath(using: .fillStroke)
        
    }
 

}
