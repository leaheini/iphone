//
//  ThirdViewController.swift
//  DrawProject
//
//  Created by Leah  Eini on 15/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    
    @IBAction func lineSlider(_ sender: UISlider) {
        
        let traingleView = self.view as? HwTraingleView
        traingleView?.lineWidth = CGFloat(sender.value)
    }
}
