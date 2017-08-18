//
//  ViewController.swift
//  MultiToggleProject
//
//  Created by hackeru on 30/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var toggleImageView: ToggleImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        toggleImageView.toggleImages = [
            #imageLiteral(resourceName: "icons8-donald_trump-0"),
            #imageLiteral(resourceName: "icons8-donald_trump-1"),
            #imageLiteral(resourceName: "icons8-donald_trump-2"),
            #imageLiteral(resourceName: "icons8-donald_trump-3"),
            #imageLiteral(resourceName: "icons8-donald_trump-4")
        ]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

