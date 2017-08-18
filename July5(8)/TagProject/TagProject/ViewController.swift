//
//  ViewController.swift
//  TagProject
//
//  Created by hackeru on 05/07/2017.
//  Copyright © 2017 Leah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    /*
     @IBAction func btnAction(_ sender: UIButton) {
     self.view.viewWithTag(100)?.backgroundColor = UIColor.randomColor
     }
     */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // create button without action
        let button = self.view.viewWithTag(101) as? UIButton   //casting
        //hook IBAction progomatically
        button?.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }
    
    func buttonAction(){
        let myView = self.view.viewWithTag(100)
        myView?.backgroundColor = .randomColor
    }
}

