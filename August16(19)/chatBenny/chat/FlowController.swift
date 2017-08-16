//
//  FlowController.swift
//  chat
//
//  Created by Benny Davidovitz on 13/08/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit
import Firebase

class FlowController{
    
    static let shared = FlowController()
    
    weak var window : UIWindow?
    
    func determineRoot(){
        let didLogin : Bool = Auth.auth().currentUser != nil
        let name = didLogin ? "Chat" : "Login"
        let storyboard = UIStoryboard(name: name, bundle: .main)
        let rootVC = storyboard.instantiateInitialViewController()
        
        window?.rootViewController = rootVC
    }
    
}



























