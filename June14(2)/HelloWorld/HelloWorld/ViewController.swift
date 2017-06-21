//
//  ViewController.swift
//  HelloWorld
//
//  Created by hackeru on 14/06/2017.
//  Copyright © 2017 leah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var textField: UITextField!

    @IBAction func buttonPressed(_ sender: Any) {
        
        let text = textField.text!  // i means not nil
        label.text = "hello " + text
        
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //self.view.backgroundColor = .red
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

