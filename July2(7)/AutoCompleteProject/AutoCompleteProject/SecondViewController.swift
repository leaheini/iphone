//
//  SecondViewController.swift
//  AutoCompleteProject
//
//  Created by hackeru on 02/07/2017.
//  Copyright © 2017 Juda. All rights reserved.
//

import UIKit
import GooglePlaces

class SecondViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textField.delegate = self     // so it listen to SecondView Controller
        
        // Do any additional setup after loading the view.
    }

    func displayAutoComplete(){
        let controller = GMSAutocompleteViewController()
        controller.delegate = self
        self.present(controller, animated: true, completion: nil)
    }
    
}

extension SecondViewController : UITextFieldDelegate{
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        displayAutoComplete()
        return false   // so keybaord wont open
    }
}

extension SecondViewController : GMSAutocompleteViewControllerDelegate{
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
        textField.text = place.name + " " + (place.formattedAddress ?? "")
        viewController.dismiss(animated: true, completion: nil)
    }
    
    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
        print(error)
    }
    
    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
        viewController.dismiss(animated: true, completion: nil)
    }
}

