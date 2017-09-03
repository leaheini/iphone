//
//  SettingsViewController.swift
//  RandomUserProject
//
//  Created by hackeru on 30/08/2017.
//  Copyright © 2017 leah.eini. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    
    @IBOutlet weak var genderSegmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Settings"
        
        genderSegmentedControl.selectedSegmentIndex = Settings.shared.gender.rawValue
    }

    @IBAction func genderSegmentetControlAction(_ sender: UISegmentedControl) {
        
        guard let gender = Settings.Gender(rawValue: sender.selectedSegmentIndex) else{
            return
        }
        
        Settings.shared.gender = gender
    }
    

}
