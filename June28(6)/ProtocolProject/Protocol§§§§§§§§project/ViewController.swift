//
//  ViewController.swift
//  Protocol§§§§§§§§project
//
//  Created by hackeru on 28/06/2017.
//  Copyright © 2017 Juda. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var toggleSwitch: UISwitch!
    @IBOutlet weak var textField: UITextField!
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextVC = segue.destination as? SecondViewController{
            nextVC.text = textField.text
            nextVC.delegate = self   // so the delegate wont be nil
        }
    }
    
    //MARK: - IBAction Methods
    
    @IBAction func tapAction(_ sender: AnyObject) {
        textField.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        textField.delegate = self
    }

    //MARK: - UITextFiels Delegate - 
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return toggleSwitch.isOn
    }

}

extension ViewController : SecondViewControllerDelegate{
    func secondViewController(_ controller: SecondViewController, theTypedText text: String?) {
        textField.text = text
    }
}

