//
//  AppControl.swift
//  CustomControl
//
//  Created by hackeru on 30/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class AppControl: UIControl {

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
        layer.borderColor = UIColor(red: 8/255.0, green: 64/255.0, blue: 128/255.0, alpha: 1).cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 5
    }

    private func makeHighlight(_ h : Bool){
        for sub in self.subviews{
            sub.alpha = h ? 0.6 : 1.0
        }
        
        // switching also the border color
        let color = UIColor(red: 8/255.0, green: 64/255.0, blue: 128/255.0, alpha: 1)
        layer.borderColor = color.withAlphaComponent(h ? 0.6 : 1).cgColor

    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let begin = super.beginTracking(touch, with: event)
        makeHighlight(begin)
        return begin
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let should = super.continueTracking(touch, with: event)
        makeHighlight(should)
        return should
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        makeHighlight(false)
        super.endTracking(touch, with: event)
    }
    
    override func cancelTracking(with event: UIEvent?) {
        makeHighlight(false)
        super.cancelTracking(with: event)
    }
}
