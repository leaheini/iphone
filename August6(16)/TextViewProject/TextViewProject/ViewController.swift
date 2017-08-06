//
//  ViewController.swift
//  TextViewProject
//
//  Created by hackeru on 02/08/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //to close the keybaurd when touch on the white background on the iPhone
    @IBAction func tapAction(_ sender: Any) {
        self.view.endEditing(true)
    }
    
    // to recognize click on the return key
    @IBAction func didEndOnExit(_ sender: UITextField) {
        // if there is next field move next
        if let next = self.view.viewWithTag(sender.tag + 1) as? UITextField{
            next.becomeFirstResponder()  // open keybaurd
        } else {
            tapAction(sender)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

