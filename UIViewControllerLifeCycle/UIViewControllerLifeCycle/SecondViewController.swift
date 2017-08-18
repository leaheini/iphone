//
//  SecondViewController.swift
//  UIViewControllerLifeCycle
//
//  Created by hackeru on 02/07/2017.
//  Copyright © 2017 Juda. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
        
        //print(String(describing: FirstViewController.self))
        print(String(describing: type(of: self)))
        print(#function)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        //self.title = "Second VC"    // can inflounce on tab bar also, mean not specific
        self.navigationItem.title = "Second VC"   // to put title
        
        print(String(describing: type(of: self)))
        print(#function)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print(String(describing: type(of: self)))
        print(#function)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print(String(describing: type(of: self)))
        print(#function)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print(String(describing: type(of: self)))
        print(#function)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print(String(describing: type(of: self)))
        print(#function)
    }
    
    deinit {
        print(String(describing: type(of: self)))
        print(#function)
    }
}
