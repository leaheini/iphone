//
//  NamesViewController.swift
//  Pickers
//
//  Created by hackeru on 02/08/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class NamesViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var namesPickerView: UIPickerView!
    
    let firstName :[String] = [
        "Leah",
        "בני",
        "Eyal"
    ]
    
    let lastName : [String] = [
        "Eini",
        "עיוני",
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    //MARK: - UIPickerView Data Source -
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return component == 0 ? firstName.count : lastName.count
    }
    
    //MARK: - UIPickerView Delegate -
    /*
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return component == 0 ? firstName[row] : lastName[row]
    }
 */
    
    // in order to custom the label instead of titleForRow func
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        let size = pickerView.rowSize(forComponent: component)
        let label = UILabel(frame: CGRect(origin: .zero, size: size))
        
        label.text = "     " + (component == 0 ? firstName[row] : lastName[row])
        label.textAlignment = .right
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.adjustsFontSizeToFitWidth = true
        
        return label
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
