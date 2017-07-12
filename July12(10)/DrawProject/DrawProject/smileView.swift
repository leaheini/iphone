//
//  smileView.swift
//  DrawProject
//
//  Created by hackeru on 12/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

@IBDesignable class smileView: UIView { //@IBDesignable to show on story
    
    // sad -1..1 happy
    private var _factor : CGFloat = 1
    
    @IBInspectable var factor : CGFloat {
        set{
            guard newValue >= -1 && newValue <= 1 else {
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
        backgroundColor = .white
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
        
        let start = CGPoint(x: w * 0.2, y: h * 0.4)
        let end = CGPoint(x: w * 0.8, y: start.y)
        
        let verticalFactor = h * 0.15 * factor
        
        let cp1 = CGPoint(x: w * 0.4, y: start.y + verticalFactor)
        let cp2 = CGPoint(x: w * 0.6, y: end.y + verticalFactor)

        
        context.move(to: start)
        context.addCurve(to: end, control1: cp1, control2: cp2)
        
        context.setLineWidth(2)
        context.strokePath()
    }
    

}
