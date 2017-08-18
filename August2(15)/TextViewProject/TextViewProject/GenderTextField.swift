//
//  GenderTextField.swift
//  TextViewProject
//
//  Created by hackeru on 02/08/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class GenderTextField: UITextField {

    enum Gender : Int{
        case male, female
        
        static let count = 2
        
        func stringVal() -> String{
            switch self{
            case .male: return "גבר שבגברים"
            case .female: return "מלכת השושנים"
            }
        }
    }

    var gender : Gender = .male{
        didSet{
            self.text = gender.stringVal()
        }
    }
    
    //from stroryboard
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
        let pickerView = UIPickerView()
        pickerView.backgroundColor = .white
        
        pickerView.dataSource = self
        pickerView.delegate = self
        
        self.inputView = pickerView
    }
    
    // overide keyboard open method
    override func becomeFirstResponder() -> Bool {
        let result = super.becomeFirstResponder()
        
        if result{
            self.text = gender.stringVal()
        }
        
        return result
    }
    
}

extension GenderTextField : UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let g = Gender(rawValue: row)
        return g?.stringVal()
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        guard let g = Gender(rawValue: row) else {
            return
        }
        
        self.gender = g
        
        self.sendActions(for: .editingChanged)
    }
}
