//
//  ToastLabel.swift
//  ToastProject
//
//  Created by hackeru on 19/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

extension String{
    func toast(){
        ToastLabel.toast(with: self)
    }
}

extension UIView{
    func toast(with text : String){
        ToastLabel.toast(with: text, on: self)
    }
}

class ToastLabel: UILabel {
    
    class func toast(with text : String,
                     on view : UIView? = nil,
                     fadeInDuration : TimeInterval = 1.5,
                     fadeOutTuration : TimeInterval = 1.5,
                     relativeVerticalPosition : CGFloat = 0.3){
        
        let superView : UIView
        if let view = view{
            superView = view
        } else{
            superView = UIApplication.shared.delegate!.window!!
        }
        let label = ToastLabel(frame: CGRect(x: 0, y: 0,
                                             width: superView.bounds.width * 0.8,
                                             height: superView.bounds.height * 0.2))
        label.center = CGPoint(x: superView.bounds.width * 0.5,
                               y: superView.bounds.height * relativeVerticalPosition)
        label.text = text
        label.alpha = 0
        superView.addSubview(label)
        
        UIView.animate(withDuration: fadeInDuration, animations: { 
            label.alpha = 1
        }) { _ in
            
            UIView.animate(withDuration: fadeOutTuration, animations: {
                label.alpha = 0
            }, completion: { _ in
                label.removeFromSuperview()
            })
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
        self.font = UIFont.boldSystemFont(ofSize: 20)
        self.textColor = .white
        self.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        layer.cornerRadius = 10
        layer.masksToBounds = true
        textAlignment = .center
        
    }


}
