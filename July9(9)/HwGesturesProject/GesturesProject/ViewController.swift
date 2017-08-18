//
//  ViewController.swift
//  GesturesProject
//
//  Created by hackeru on 05/07/2017.
//  Copyright © 2017 Leah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let myView = self.view.viewWithTag(1) else {
            return
        }
        
        let radians = CGFloat.pi * 0.25  //45 degrees
        myView.transform = CGAffineTransform(rotationAngle: radians)
        
        //back to default
        //myView.transform = .identity
        
    }

    @IBAction func tapGestureAction(_ sender: UITapGestureRecognizer) {
        sender.view?.backgroundColor = .randomColor
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

