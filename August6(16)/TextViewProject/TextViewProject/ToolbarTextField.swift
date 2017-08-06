//
//  ToolbarTextField.swift
//  TextViewProject
//
//  Created by hackeru on 06/08/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class ToolbarTextField: UITextField {

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
    
    func setup(){
        // create toolbar
        let width = UIScreen.main.bounds.width
        let rect = CGRect(x: 0, y: 0, width: width, height: 44)
        let toolbar = UIToolbar(frame: rect)
        
        // create button
        let buttonText = self.returnKeyType == .next ? "Next" : "Done"
        let button = UIBarButtonItem(title: buttonText, style: .done, target: self, action: #selector(buttonAction))
        
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        toolbar.items = [spaceButton, button]
        
        self.inputAccessoryView = toolbar
    }
    
    func buttonAction(){
        // text fiels listen to did on exit
        self.sendActions(for: .editingDidEndOnExit)
    }

}
