//
//  DrawView.swift
//  DrawSomething
//
//  Created by hackeru on 16/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class DrawView: UIView {
    
    //var beziers : [UIBezierPath] = []
    private var beziers : [UIBezierPath] = []
    private var redoBeziers : [UIBezierPath] = []
    
    var bezier : UIBezierPath = UIBezierPath()   // akuma which manage all the funcs to draw
    var strokeWidth : CGFloat = 1
        /*
        {    // 1 by default
        didSet{    // to do something after the set, to influence what we already draw before (back)
            bezier.lineWidth = strokeWidth
            setNeedsDisplay()
        }
    }
     */
    
    var strokColor : UIColor?
    
    func clear(){
        //bezier = UIBezierPath()
        beziers = []
        setNeedsDisplay()
    }
    
    func undo(){
        guard !beziers.isEmpty else {
            return
        }
        redoBeziers.append(beziers.removeLast())
        setNeedsDisplay()
    }
    
    func redo(){
        guard !redoBeziers.isEmpty else {
            return
        }
        let b = redoBeziers.removeLast()
        beziers.append(b)
        setNeedsDisplay()
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
        isMultipleTouchEnabled = false   // draw with only one finger
    }

    
    private func startWith(point : CGPoint){
        //bezier.move(to: point)    // move - go to start point
        
        redoBeziers = []

        //let b = UIBezierPath()
        let b = ColorBezierPath()
        b.lineWidth = strokeWidth
        b.strokeColor = strokColor
        b.move(to: point)
        beziers.append(b)
    }
    
    private func addLineTo(point: CGPoint){
        //bezier.addLine(to: point)
        
        guard let b = beziers.last else {
            return
        }
        b.addLine(to: point)
        setNeedsDisplay()
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        guard let t = touches.first else {
            return
        }
        
        let p = t.location(in: self)
        startWith(point: p)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        
        guard let t = touches.first else {
            return
        }
        
        let p = t.location(in: self)
        addLineTo(point: p)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        
        guard let t = touches.first else {
            return
        }
        
        let p = t.location(in: self)
        addLineTo(point: p)
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        
        guard let t = touches.first else {
            return
        }
        
        let p = t.location(in: self)
        addLineTo(point: p)
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        //bezier.stroke()
        
        for b in beziers{
            b.stroke()
        }
        
    }
 

}
