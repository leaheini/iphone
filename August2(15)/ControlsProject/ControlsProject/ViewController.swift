//
//  ViewController.swift
//  ControlsProject
//
//  Created by hackeru on 02/08/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var switchStatusLabel: UILabel!
    @IBOutlet weak var mySwitch: UISwitch!
    @IBOutlet weak var connectionSwitch: UISwitch!
    
    @IBOutlet weak var stepperLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    
    @IBAction func stepperAction(_ sender: UIStepper) {
        //stepperLabel.text = sender.value.description
        //or
        let text = String(format: "%.1f", sender.value)
        stepperLabel.text = text
    }
    
    var reachability : Reachability

    required init?(coder aDecoder: NSCoder) {
        reachability = Reachability.forInternetConnection()
        super.init(coder: aDecoder)
    }
    
    @IBAction func mySwitchAction(_ sender: UISwitch) {
        switchStatusLabel.text = sender.isOn.description
        // or
        //switchStatusLabel.text = sender.isOn ? "on" : "off"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //// label show switch status imidiate on load
        // direct invokation
        mySwitchAction(mySwitch)
        // or trigger action
        //mySwitch.sendActions(for: .valueChanged)
        
        //// make the switcher bigger X2
        mySwitch.transform = CGAffineTransform(scaleX: 2, y: 2)
        
        // switch will be ON if internet connect
        connectionSwitch.isOn = reachability.currentReachabilityStatus() != NotReachable
        
        //notification every time the internet status changed
        reachability.stopNotifier()
        NotificationCenter.default.addObserver(forName: .reachabilityChanged, object: nil, queue: .main) { (notification) in
            self.connectionSwitch.isOn = self.reachability.currentReachabilityStatus() != NotReachable
        }
        
        stepper.sendActions(for: .valueChanged)
    }


}

