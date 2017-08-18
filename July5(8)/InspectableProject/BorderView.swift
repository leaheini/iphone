//  BorderView.swift
//  InspectableProject

//  Created by hackeru on 05/07/2017.
//  Copyright © 2017 Leah. All rights reserved.

import UIKit

//@IBDesignable class BorderView: UIView {      //or
extension UIView{      //influence all view
    
    @IBInspectable var borderColor : UIColor?{
        set{
            self.layer.borderColor = newValue?.cgColor
        }
        get{
            if let cgColor = self.layer.borderColor{
                return UIColor(cgColor: cgColor)
            }else{
                return nil
            }
        }
    }
    
    @IBInspectable var borderWidth : CGFloat{
        set{
            self.layer.borderWidth = newValue
        }
        get{
            return self.layer.borderWidth
        }
    }
    
    @IBInspectable var cornerRadius : CGFloat{
        set{
            self.layer.cornerRadius = newValue
        }
        get{
            return self.layer.cornerRadius
        }
    }
    
    //end
}
