//
//  BoldLabel.swift
//  SubclassLabel
//
//  Created by hackeru on 19/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class BoldLabel: UILabel {
    
    var edgeInsets : UIEdgeInsets = .zero    // (0,0,0,0)

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
        //self.font = UIFont.boldSystemFont(ofSize: 20)      //font
        //self.font = UIFont(name: "Arial-BoldMT", size: 20)     // to determine the font type
        self.font = UIFont(name: "Oswald-Bold", size: 24)
        
        textColor = .purple    //color
        
        shadowColor = UIColor.black.withAlphaComponent(0.7)  // shadow
        shadowOffset = CGSize(width: 1, height: 1)
        
        backgroundColor = UIColor.cyan    //bg color

        layer.borderWidth = 1   //border
        layer.borderColor = UIColor.blue.cgColor
        layer.cornerRadius = 10
        layer.masksToBounds = true  // to make backgroundColor wont out from layer
        
        textAlignment = .center     //alignment
        
        //inset
        self.edgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
    
    override func drawText(in rect: CGRect) {
        let newRect = UIEdgeInsetsInsetRect(rect, self.edgeInsets)
        super.drawText(in: newRect)
    }
    
    override var intrinsicContentSize: CGSize{
        get{
            var size = super.intrinsicContentSize
            size.width += self.edgeInsets.left + self.edgeInsets.right
            size.height += self.edgeInsets.top + self.edgeInsets.bottom
            return size
        }
    }
   
}
