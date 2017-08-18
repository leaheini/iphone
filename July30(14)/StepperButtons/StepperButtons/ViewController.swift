//
//  ViewController.swift
//  StepperButtons
//
//  Created by hackeru on 30/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var minusBtn: UIButton!
    @IBOutlet weak var plusBtn: UIButton!
    @IBOutlet weak var mySwitch: UISwitch!
    
    let numMaxValue : Int = 20
    let numMinValue : Int = 0
    
    var num : Int = 1{
        didSet{
            labelCounter.text = "\(num)"
            
            plusBtn.isEnabled = num != numMaxValue
            minusBtn.isEnabled = num != numMinValue
            
            //save to disk
            let defaults = UserDefaults.standard
            defaults.set(num, forKey: "num")
            defaults.synchronize()
        }
    }
    
    @IBOutlet weak var labelCounter: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // found the directory of the xml
        let docDir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        print(docDir)
        
        // read from Disk
        if let val = UserDefaults.standard.object(forKey: "num") as? Int{   // casting to Int, if it Int continue
            self.num = val
        }
        
        if let val = UserDefaults.standard.object(forKey: "switch") as? Bool{
            mySwitch.isOn = val
        }
    }

    @IBAction func btnCounterAction(_ sender: UIButton) {
        switch sender.tag{
        case 1:    // plus
            num = min(num + 1, numMaxValue)
            break
        case 0:   // minus
            num = max(num - 1, numMinValue)
            break
        default:
            break
        }
    }
    
    @IBAction func switchAction(_ sender: UISwitch) {
        // save to disk
        let defaults = UserDefaults.standard
        defaults.set(sender.isOn, forKey: "switch")
        defaults.synchronize()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

