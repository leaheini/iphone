//
//  ViewController.swift
//  chat
//
//  Created by hackeru on 13/08/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

// depricated
import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        signOut()
        
        if let userId = Auth.auth().currentUser?.uid{
            print("User Id is: " + userId)
        }
        
        testSignIn()
        
        //testSignUp()   // we delete cause user is allready exist
    }

    func testSignUp(){
        Auth.auth().createUser(withEmail: "leah@gmail.com", password: "123456") { (user, error) in
            if let error = error{
                print(error)
            } else {
                print(user?.email ?? "")
            }
        }
        
    }
    
    func testSignIn(){
        Auth.auth().signIn(withEmail: "leah@gmail.com", password: "123456") {
            (user, error) in
            if let userId = Auth.auth().currentUser?.uid{
                print("User Id is: " + userId)
            }
        }
    }
    
    func signOut(){
        try? Auth.auth().signOut()   // try? cause its throw
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

