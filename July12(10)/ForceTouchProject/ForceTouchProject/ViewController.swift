//
//  ViewController.swift
//  ForceTouchProject
//
//  Created by hackeru on 12/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func forceTouchAction(_ sender: ForceTouchGestureRecognizer) {
        
        guard let label = sender.view as? UILabel else {
            return
        }
        
        label.text = sender.force.description
    }
    

}

