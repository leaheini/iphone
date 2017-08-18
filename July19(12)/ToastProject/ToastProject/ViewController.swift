//
//  ViewController.swift
//  ToastProject
//
//  Created by hackeru on 19/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func buttonAction(_ sender: Any) {
        //option 1: with the class
        //ToastLabel.toast(with: "test1", on: self.view, fadeInDuration: 3, fadeOutTuration: 3, relativeVerticalPosition: 0.4)
        
        //option 2: with the extension to UIView
        //self.view.toast(with: "test2")
        
        //option 3: with the extension to String   -> the best option 
        "My Toast".toast()
    }

    

}

