//
//  BirthdayDatePicker.swift
//  TextViewProject
//
//  Created by Leah  Eini on 06/08/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class BirthdayDatePicker: UITextField {
    

    let bdayDatePicker : UIDatePicker = UIDatePicker()
    var date : Date{
        get{
            return bdayDatePicker.date
        }
    }
    

    //from storyboard
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    //from code
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    private func setup(){

        bdayDatePicker.datePickerMode = .date
        
        var timesSecFrom1970 = Date().timeIntervalSince1970   // seconds till now
        timesSecFrom1970 -= timesSecFrom1970.truncatingRemainder(dividingBy: 86_400)  // seconds till last midnight 00:00:00.000
        
        // make max date today
        let maxDate = Date(timeIntervalSince1970: timesSecFrom1970)
        bdayDatePicker.maximumDate = maxDate
        
        // make min date -120 years back from today
        let minDate = bdayDatePicker.calendar.date(byAdding: .year, value: -120, to: maxDate)
        bdayDatePicker.minimumDate = minDate
        
        bdayDatePicker.addTarget(self, action: #selector(dateChanged(_:)), for: .valueChanged)
        
        self.inputView = bdayDatePicker
    }
    
    func dateChanged(_ sender : UIDatePicker){
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        
        self.text = formatter.string(from: sender.date)
    }
    
    // overide keyboard open method
    override func becomeFirstResponder() -> Bool {
        let result = super.becomeFirstResponder()
        
        if result{
            dateChanged(bdayDatePicker)
        }
        
        return result
    }
    

}
