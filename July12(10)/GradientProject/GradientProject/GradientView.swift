//
//  GradientView.swift
//  GradientProject
//
//  Created by hackeru on 12/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class GradientView: UIView {

    var colors : [UIColor] = [.white]{
        didSet{
            //refresh colors (gradient layer)
            guard let gradient = self.layer.sublayers?.first as? CAGradientLayer else {     //casting to check it wasnt changed to layer with other type
                return
            }
            
            gradient.colors = self.cgColors          // if its the layer refresh the colors
        }
    }
    
    private var cgColors : [CGColor] {
        get{
            return colors.map { $0.cgColor }
            
            //or the same as
            
            /*
            let b : [CGColor] = colors.map { (c : UIColor) -> CGColor in
                return c.cgColor
            }
            
            //or
            
            var arr : [CGColor] = []
            for obj in colors{
                arr.append(obj.cgColor)
            }
            return arr  */
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
        //create gradient layer
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds       // so cover all parent view
        gradient.colors = self.cgColors
        
        self.layer.insertSublayer(gradient, at: 0)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        guard let gradient = self.layer.sublayers?.first as? CAGradientLayer else {
            return
        }
        gradient.frame = self.bounds
    }

}
