//
//  SettingsViewController.swift
//  RandomUserProject
//
//  Created by hackeru on 30/08/2017.
//  Copyright © 2017 leah.eini. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var genderSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var nationalPicker: UIPickerView!
    
    let natArr : [String] = [
        "AU",
        "BR",
        "CA",
        "CH",
        "DE",
        "DK",
        "ES",
        "FI",
        "FR",
        "GB",
        "IE",
        "IR",
        "NL",
        "NZ",
        "TR",
        "US"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Settings"
        
        genderSegmentedControl.selectedSegmentIndex = Settings.shared.gender.rawValue
        nationalPicker.selectedRow(inComponent: 1) = Settings.nat
    }

    @IBAction func genderSegmentetControlAction(_ sender: UISegmentedControl) {
        
        guard let gender = Settings.Gender(rawValue: sender.selectedSegmentIndex) else{
            return
        }
        
        Settings.shared.gender = gender
        
        self.navigationController?.popViewController(animated: true)
    }
    
    //MARK: - UIPickerView Data Source -
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1  // cause only one column
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return natArr.count   //number of rows
    }
    
    // instead of next paragraph titleForRow
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let text = natArr[row]
        let color : UIColor = (row % 2 == 0) ? .purple : .blue  // double purple, odd blue
        
        //return NSAttributedString(string: text, attributes: [NSFontAttributeName : color])
        
        let atts = [
            NSForegroundColorAttributeName:color,
            NSFontAttributeName:UIFont.boldSystemFont(ofSize: 10)
        ]
        return NSAttributedString(string: text, attributes: atts)
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

        guard let nat = Settings.nat(row) else{
            return
        }
        
        Settings.shared.nat = nat
        
        self.navigationController?.popViewController(animated: true)
    }
    
    /*
     //MARK: - UIPickerView Delegate -
     func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
     return natArr[row]
     }
     */

    
}
