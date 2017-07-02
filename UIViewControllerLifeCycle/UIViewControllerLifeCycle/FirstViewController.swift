//
//  FirstViewController.swift
//  UIViewControllerLifeCycle
//
//  Created by hackeru on 02/07/2017.
//  Copyright © 2017 Juda. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
        
        //print(String(describing: FirstViewController.self))
        print(String(describing: type(of: self)))
        print(#function)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        print(String(describing: type(of: self)))
        print(#function)
        
        print(label.frame.origin.x)
    }

    override func viewWillAppear(_ animated: Bool) {
        print(String(describing: type(of: self)))
        print(#function)
        
        self.view.backgroundColor = .red
        
        print(label.frame.origin.x)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print(String(describing: type(of: self)))
        print(#function)
        
        self.view.backgroundColor = .blue
    }

    override func viewWillDisappear(_ animated: Bool) {
        print(String(describing: type(of: self)))
        print(#function)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print(String(describing: type(of: self)))
        print(#function)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print(String(describing: type(of: self)))
        print(#function)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        print(String(describing: type(of: self)))
        print(#function)
        
        print(label.frame.origin.x)
    }
    
}
