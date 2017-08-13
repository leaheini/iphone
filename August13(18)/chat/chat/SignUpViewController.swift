//
//  SignUpViewController.swift
//  chat
//
//  Created by hackeru on 13/08/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {
    
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var password2TextField: UITextField!
    @IBOutlet var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func signUpAction(_ sender: Any) {
        guard let email = emailTextField.text,
            let password = passwordTextField.text,
            let password2 = password2TextField.text,
            let name = nameTextField.text
        else {
            return
        }
        
        guard password == password2 else {
            //TODO: toast to user
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            if let error = error{
                print(error)
                return
            }
            
            //update name to firebase
            let request = user?.createProfileChangeRequest()
            request?.displayName = name
            
            request?.commitChanges(completion: { (error) in
                FlowController.shared.determineRoot()
            })
        }
    
      
    
    }
    
    
}
