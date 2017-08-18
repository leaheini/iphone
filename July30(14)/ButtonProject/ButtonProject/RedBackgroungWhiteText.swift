//
//  RedBackgroungWhiteText.swift
//  ButtonProject
//
//  Created by hackeru on 30/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class RedBackgroungWhiteText: UIButton {

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
        self.setTitleColor(UIColor.white, for: .normal)
        setTitleColor(.red, for: .highlighted)
        self.backgroundColor = .red
        layer.borderColor = UIColor.red.cgColor   // without border witdh so no seen
        self.layer.cornerRadius = self.bounds.height * 0.5  
        self.layer.masksToBounds = true   // wont out from borders
        self.contentEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)  // spacing text from border
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)   // to make text bold
    }
    
    //after constriants refresh
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = self.bounds.height * 0.5
    }
    
    private func makeHighlited(_ h : Bool){
        if h{
            backgroundColor = .white
            layer.borderWidth = 1
        } else {
            backgroundColor = .red
            layer.borderWidth = 0
        }
    }
    
    // when recognize tapping on the button
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        makeHighlited(true)
        return super.beginTracking(touch, with: event)
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        makeHighlited(false)
        return super.endTracking(touch, with: event)    }
    
    override func cancelTracking(with event: UIEvent?) {
        makeHighlited(false)
        return super.cancelTracking(with: event)
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
