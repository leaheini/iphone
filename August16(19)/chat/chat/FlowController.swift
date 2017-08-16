//
//  FlowController.swift
//  chat
//
//  Created by hackeru on 13/08/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit
import Firebase

// to know which storybaoad to open
class FlowController{

    static let shared = FlowController()
    
    weak var window  : UIWindow?
    
    func determineRoot(){
        let didLogin : Bool = Auth.auth().currentUser != nil
        let name = didLogin ? "Chat" : "Login"
        let storyboard = UIStoryboard(name: name, bundle: .main)
        let rootVC = storyboard.instantiateInitialViewController()
        window?.rootViewController = rootVC
    }
    
    

}
