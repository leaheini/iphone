//
//  ViewController.swift
//  DateConverter
//
//  Created by hackeru on 18/06/2017.
//  Copyright © 2017 Juda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    enum ConvertType : Int{
        case gregToHeb  //0
        case hebToGreg  //1
        case gregToCh
        
        static let count = 2
        
        func origin() -> Calendar{
            switch self {
            case .gregToHeb, .gregToCh:
                return Calendar(identifier: .gregorian)
            case .hebToGreg:
                return Calendar(identifier: .hebrew)
            }
        }
        
        func destination() -> Calendar{
            switch self{
            case .gregToHeb: return Calendar(identifier: .hebrew)
            case .hebToGreg: return Calendar(identifier: .gregorian)
            case .gregToCh: return Calendar(identifier: .chinese)
            }
        }
        
    }
    
    var type : ConvertType = .gregToHeb

    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBAction func segmentedControlAction(_ sender: UISegmentedControl) {
        
        let index : Int = sender.selectedSegmentIndex
        guard let t = ConvertType(rawValue: index) else {
            print("unsupported index \(index)")
            return
        }
        
        self.type = t
        datePicker.calendar = type.origin()    // refresh date picker
        
        dateChanged(datePicker)  // refresh label
        
    }
    
    
    @IBAction func dateChanged(_ sender: UIDatePicker) {
        
        let formatter = DateFormatter()
        formatter.calendar = type.destination()
        //formatter.calendar = Calendar(identifier: .hebrew)
        formatter.locale = Locale(identifier: "he")
        formatter.dateStyle = .full
        formatter.timeStyle = .none
        formatter.doesRelativeDateFormatting = true
        
        //let date : Date = sender.date
        let str = formatter.string(from: sender.date)    // (from: date)
        label.text = str
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //dateChanged(datePicker)
        //datePicker.sendActions(for: .valueChanged)
        segmentedControlAction(segmentedControl)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

