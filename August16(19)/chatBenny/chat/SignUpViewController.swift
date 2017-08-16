//
//  SignUpViewController.swift
//  chat
//
//  Created by Benny Davidovitz on 13/08/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var password2TextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func signUpAction(_ sender: Any) {
        guard let email = emailTextField.text,
            let password = passwordTextField.text,
            let password2 = password2TextField.text,
            let name = nameTextField.text
        else{
            return
        }
        
        guard password == password2 else {
            //TODO: toast to user
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { (user, err) in
            if let err = err{
                //TODO: toast to user
                print(err)
                return
            }
            
            //update name to firebase
            let request = user?.createProfileChangeRequest()
            request?.displayName = name
            
            request?.commitChanges(completion: { (err) in
                FlowController.shared.determineRoot()
            })
        }
        
        
    }
    

}








