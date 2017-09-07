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
   
    var pickerArray : [Settings.Nationality] {
        get{
            return Settings.shared.allNationalities
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Settings"
        
        genderSegmentedControl.selectedSegmentIndex = Settings.shared.gender.rawValue
        
        if let code = Settings.shared.natCode,
            let index = pickerArray.index(where: { $0.code == code}){
            
            let intIndex = Int(index)
            nationalPicker.selectRow(intIndex, inComponent: 0, animated: false)
        }

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
        return pickerArray.count   //number of rows
    }
    
    // instead of next paragraph titleForRow
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let nat = pickerArray[row]
        let text = nat.name
        let color : UIColor = (row % 2 == 0) ? .purple : .blue  // double purple, odd blue
        
        //return NSAttributedString(string: text, attributes: [NSFontAttributeName : color])
        
        let atts = [
            NSForegroundColorAttributeName:color,
            NSFontAttributeName:UIFont.boldSystemFont(ofSize: 10)
        ]
        return NSAttributedString(string: text, attributes: atts)
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

        let nat = pickerArray[row]
        
        Settings.shared.natCode = nat.code
        
    }
    
    /*
     //MARK: - UIPickerView Delegate -
     func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
     return natArr[row]
     }
     */

    
}
