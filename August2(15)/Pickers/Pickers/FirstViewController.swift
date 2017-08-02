//
//  FirstViewController.swift
//  Pickers
//
//  Created by hackeru on 02/08/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var label: UILabel!
    
    @IBAction func dateChangedAction(_ sender: UIDatePicker) {
        /*
        //display date
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        
        label.text = formatter.string(from: sender.date)
 */
        
        //display age 
        let comps : DateComponents = sender.calendar.dateComponents([.year], from: sender.date, to: Date())
        let age = comps.year!   // ! cause optional and not nil
        label.text = "\(age) years old"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var timesSecFrom1970 = Date().timeIntervalSince1970   // seconds to 2.8.17 now 11:12:14.567
        timesSecFrom1970 -= timesSecFrom1970.truncatingRemainder(dividingBy: 86_400)  // seconds to 2.8.17 00:00:00.000
        
        let maxDate = Date(timeIntervalSince1970: timesSecFrom1970)
        datePicker.maximumDate = maxDate
        
        let minDate = datePicker.calendar.date(byAdding: .year, value: -100, to: maxDate)
        datePicker.minimumDate = minDate
        
        // start date and if error bring maxDate
        datePicker.date = datePicker.calendar.date(byAdding: .year, value: -18, to: maxDate) ?? maxDate
        
        datePicker.sendActions(for: .valueChanged)
    }

}

