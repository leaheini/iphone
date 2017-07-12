//
//  ViewController.swift
//  GradientProject
//
//  Created by hackeru on 12/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let gView = self.view as? GradientView  
        gView?.colors = [.blue, .white, .red]
    }

}

