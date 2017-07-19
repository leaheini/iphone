//
//  ViewController.swift
//  LabelProject2
//
//  Created by hackeru on 19/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var mySwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.textColor = .green
        label.font = UIFont.italicSystemFont(ofSize: 24)
        label.highlightedTextColor = .red
        mySwitch.sendActions(for: .valueChanged)    // call the action to make it red on laud
        
    }
    
    @IBAction func highlightedAction(_ sender: UISwitch) {
        label.isHighlighted = sender.isOn
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
    }


}

