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
        
        label.textColor = .blue
        label.font = UIFont.italicSystemFont(ofSize: 24)
        label.highlightedTextColor = .magenta
        mySwitch.sendActions(for: .valueChanged)    // on the switch to make it red on load
    }
    
    @IBAction func highlightedAction(_ sender: UISwitch) {
        label.isHighlighted = sender.isOn
    }

}

