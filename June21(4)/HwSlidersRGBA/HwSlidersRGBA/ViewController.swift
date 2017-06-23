//
//  ViewController.swift
//  HwSlidersRGBA
//
//  Created by eeyni on 23/06/2017.
//  Copyright © 2017 eyni. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var alphaSlider: UISlider!
    

    @IBOutlet weak var grbaView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        changeColor()
    }
    
    @IBAction func changeColor() {
        let redC = CGFloat(redSlider.value)
        let greenC = CGFloat(greenSlider.value)
        let blueC = CGFloat(blueSlider.value)
        let alphaC = CGFloat(alphaSlider.value)
        
        let color = UIColor(red: redC, green: greenC, blue: blueC, alpha: alphaC)
        
        grbaView.backgroundColor = color
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

