//
//  PersonViewController.swift
//  HitListCoreData
//
//  Created by hackeru on 09/08/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class PersonViewController: UIViewController {

    @IBOutlet var firstNameTextField: UITextField!
    @IBOutlet var lastNameTextField: UITextField!
    @IBOutlet var aliveSwitch: UISwitch!
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var createButton: UIButton!
    @IBOutlet var aliveLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    // MARK: - IBAction Method

    @IBAction func closeKeybordAction(_ sender: Any) {
        firstNameTextField.resignFirstResponder()  // close the keybaurd
        lastNameTextField.resignFirstResponder()
    }
 
    @IBAction func aliveSwitchAction(_ sender: UISwitch) {
        aliveLabel.text = sender.isOn ? "Is Alive" : "R.I.P. 😵"
    }
    
    @IBAction func doneAction(_ sender: Any) {
        let person = Person(context: DBManager.manager.context)  // create empty Person on the DB
        // update person properties
        person.firstName = firstNameTextField.text
        person.lastName = lastNameTextField.text
        person.isAlive = aliveSwitch.isOn
        person.createDate = datePicker.date as NSDate
        
        DBManager.manager.saveContext()    // save DB to disk
        
        navigationController?.popViewController(animated: true)  // move one screen back - TableViewController
    }
    
    
}
