//
//  ViewController.swift
//  CenterProject
//
//  Created by hackeru on 02/07/2017.
//  Copyright © 2017 Juda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var heightlayout: NSLayoutConstraint!

    @IBAction func tapAction(_ sender: UITapGestureRecognizer) {
        let point = sender.location(in: self.view)
        //myView.center = point
        
        UIView.animate(withDuration: 0.5) {     //animation of delay
            self.myView.center = point
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //do the same
        myView.layer.cornerRadius = heightlayout.constant / 2    //when the height is constant
    }

    override func viewDidLayoutSubviews() {
        
        //do the same
        myView.layer.cornerRadius = myView.frame.size.height / 2    //when the height is relative
    }
}

