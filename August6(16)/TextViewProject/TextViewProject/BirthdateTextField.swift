//
//  BirthdateTextField.swift
//  TextViewProject
//
//  Created by hackeru on 06/08/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class BirthdateTextField: ToolbarTextField {

    let datePicker : UIDatePicker = UIDatePicker()
    var date : Date{
        get{
            return datePicker.date
        }
    }
    
    // because inheret from ToolbarTextField which has akso setup, we delete the inits
    override func setup(){
        super.setup()
        
        datePicker.datePickerMode = .date
        datePicker.backgroundColor = .white
        
        var timestamp = Date().timeIntervalSince1970
        timestamp -= timestamp.truncatingRemainder(dividingBy: 86_400)
        
        datePicker.maximumDate = datePicker.calendar.date(byAdding: .year, value: 0, to: Date(timeIntervalSince1970: timestamp))
        
        datePicker.addTarget(self, action: #selector(dateChanged(_:)), for: .valueChanged)
        
        self.inputView = datePicker
    }
    
    // open the keybaurd
    override func becomeFirstResponder() -> Bool {
        let r = super.becomeFirstResponder()
        
        if r {
            dateChanged(datePicker)
        }
        
        return r
    }
    
    // #selector
    func dateChanged(_ sender : UIDatePicker){
        // formatter in order to show the date nice
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        
        self.text = formatter.string(from: sender.date)
        
        // if someone listen to changes in textFiled
        self.sendActions(for: .editingChanged)
    }

}
