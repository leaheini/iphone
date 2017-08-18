//
//  SecondViewController.swift
//  Pickers
//
//  Created by hackeru on 02/08/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var demoPickerView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        demoPickerView.dataSource = self  // just because we declared UIPickerViewDataSource
        demoPickerView.delegate = self    // just because we declared UIPickerViewDelegate
    }

    //MARK: - UIPickerView Data Source - 
    func numberOfComponents(in pickerView: UIPickerView) -> Int {    // = number of rows
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return (component + 1) * 2    // component = row number 0,1,2
    }
    
    //MARK: - UIPickerView Delegate -
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "Row \(row)"
    }

}

