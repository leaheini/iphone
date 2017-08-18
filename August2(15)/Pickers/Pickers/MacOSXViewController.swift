//
//  MacOSXViewController.swift
//  Pickers
//
//  Created by hackeru on 02/08/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class MacOSXViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {  // declaration must
    
    @IBOutlet weak var osNamesPickerView: UIPickerView!
    
    let macOSNamesArr : [String] = [
        "Cheetach",
        "Puma",
        "Jaguar",
        "Panther",
        "Tiger",
        "Leopard",
        "Snow Leopard",
        "Lion",
        "Mountain Lion",
        "Mavericks",
        "Yosemite",
        "El Capitan",
        "Sierra"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
        // no need cause we connect from story the picker to the controller
        osNamesPickerView.dataSource = self  // just because we declared UIPickerViewDataSource
        osNamesPickerView.delegate = self
         */
    }
    
    //MARK: - UIPickerView Data Source -
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1  // cause only one column
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return macOSNamesArr.count   //number of rows
    }
    
    // instead of next paragraph titleForRow
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let text = macOSNamesArr[row]
        let color : UIColor = (row % 2 == 0) ? .red : .blue  // double red, odd blue
        
        //return NSAttributedString(string: text, attributes: [NSFontAttributeName : color])
        
        let atts = [
            NSForegroundColorAttributeName:color,
            NSFontAttributeName:UIFont.boldSystemFont(ofSize: 18)
        ]
        return NSAttributedString(string: text, attributes: atts)
    }
    
    /*
    //MARK: - UIPickerView Delegate -
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return macOSNamesArr[row]
    }
 */
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
