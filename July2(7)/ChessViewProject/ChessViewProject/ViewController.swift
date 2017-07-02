//
//  ViewController.swift
//  ChessViewProject
//
//  Created by hackeru on 02/07/2017.
//  Copyright © 2017 Juda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //create rectangence from here and not from the storyboard
        let rect = CGRect(x: 60, y: 60, width: 200, height: 200)
        let orangeView = UIView(frame: rect)
        orangeView.backgroundColor = .orange
        self.view.addSubview(orangeView)
        
        let pView = PerpleView(frame: CGRect(x: 140, y: 140, width: 40, height: 40))
        orangeView.addSubview(pView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

