//
//  ViewController.swift
//  HwSlidersBenny
//
//  Created by hackeru on 25/06/2017.
//  Copyright © 2017 Juda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var alphaSlider: UISlider!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var alphaLabel: UILabel!

    @IBOutlet weak var colorView: UIView!
    
    @IBAction func sliderAction(_ sender: UISlider) {
        
        //redLabel.text = redSlider.value.description    //not good too long
        //redLabel.text = String(format: "%.2f", redSlider.value)   // good
        let intVal = Int(redSlider.value * 255)    //0...255
        let str = String(intVal, radix: 16)
        //String(<#T##value: T##T#>, radix: <#T##Int#>)
        redLabel.text = str
        blueLabel.text = String(Int(blueSlider.value * 255), radix: 16)
        greenLabel.text = String(format: "%.2f", greenSlider.value)
        alphaLabel.text = String(format: "%.2f", alphaSlider.value)
        
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: CGFloat(alphaSlider.value)
        )
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        sliderAction(redSlider)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

