//
//  ForceTouchGestureRecognizer.swift
//  ForceTouchProject
//
//  Created by hackeru on 12/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit.UIGestureRecognizerSubclass

@available(iOS 9.0, *)
class ForceTouchGestureRecognizer: UIGestureRecognizer {
    var force : CGFloat = 0    // init start the click force 0
    
    convenience init(){
        self.init(target:nil,action:nil)
    }
    
    override init(target: Any?, action: Selector?) {
        super.init(target: target, action: action)
        self.cancelsTouchesInView = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesBegan(touches, with: event)
        self.fireEventWith(state: .began, touches: touches)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesMoved(touches, with: event)
        self.fireEventWith(state: .changed, touches: touches)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesEnded(touches, with: event)
        self.fireEventWith(state: .ended, touches: touches)
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesCancelled(touches, with: event)
        self.fireEventWith(state: .cancelled, touches: touches)
    }
    
    private func fireEventWith(state : UIGestureRecognizerState, touches : Set<UITouch>){
        guard let t = touches.first else {    // the first cell at the Set of touches
            return
        }
        
        self.force = t.force    // self.force = element force we create above
        // fire IBAction
        self.state = state    // state is element of UIGestureRecognizer = the state we send to the func
    }
    
    override func reset() {
        super.reset()
        force = 0           // reset the force, no sinergia of force
    }
    
}
