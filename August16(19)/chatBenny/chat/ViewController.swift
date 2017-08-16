//
//  ViewController.swift
//  chat
//
//  Created by Benny Davidovitz on 13/08/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        signOut()
        
        if let uid = Auth.auth().currentUser?.uid{
            print("uid is: " + uid)
        }
        
        testSignIn()
        
        
        //testSignUp()
    }
    
    func testSignUp(){
        Auth.auth().createUser(withEmail: "benny.real@gmail.com", password: "123456") { (user, error) in
            
            if let error = error{
                print(error)
            } else {
                print(user?.email ?? "")
            }
            
        }
    }
    
    func testSignIn(){
        Auth.auth().signIn(withEmail: "benny.real@gmail.com", password: "123456") { (user, error) in
            
            if let uid = Auth.auth().currentUser?.uid{
                print("uid is: " + uid)
            }
            
        }
    }
    
    func signOut(){
        try? Auth.auth().signOut()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

