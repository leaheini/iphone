//
//  SecondViewController.swift
//  SwipeProject
//
//  Created by hackeru on 09/07/2017.
//  Copyright © 2017 Leah. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func backAction(_ sender: UISwipeGestureRecognizer) {
            _ = self.navigationController?.popViewController(animated: true)  // swipe one controller back
        
    }
    
    @IBAction func unwindToSecond(_ segue : UIStoryboardSegue){
        
    }

}
