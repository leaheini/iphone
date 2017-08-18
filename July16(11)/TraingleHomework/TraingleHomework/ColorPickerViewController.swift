//
//  ColorPickerViewController.swift
//  TraingleHomework
//
//  Created by hackeru on 16/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

protocol ColorPickerViewControllerDelegate {
    // method which tell story to the delegate (the influenced controller) about the choosen color
    func controller(_ controller : ColorPickerViewController, didSelectColor color : UIColor?)
}

class ColorPickerViewController: UIViewController {
    
    var delegate : ColorPickerViewControllerDelegate?
    var startColor : UIColor? = nil

    @IBOutlet weak var colorView: UIView!

    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // to make each slider of one color: red or green or blue
        if let startColor = startColor{
            var red  : CGFloat = 0
            var green : CGFloat = 0
            var blue : CGFloat = 0
            var alpha : CGFloat = 0
            startColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)   // & = address
            
            redSlider.value = Float(red)
            greenSlider.value = Float(green)
            blueSlider.value = Float(blue)
        }
        
        //init the color like the slider, enough one slider cause all 3 conect to this action
        sliderAction(redSlider)
        //or
        //redSlider.sendActions(for: .valueChanged)
    }
    
    //MARK: - IBAction Methods -
    
    @IBAction func sliderAction(_ sender: UISlider) {   // all 3 sliders connected to this action
        
        let red = CGFloat(redSlider.value)
        let green = CGFloat(greenSlider.value)
        let blue = CGFloat(blueSlider.value)
        
        colorView.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
    }
    
    @IBAction func doneAction(_ sender: Any) {    // the done button
        
        //go back -> and close this controller (remove layer)
        self.dismiss(animated: true, completion: nil)
        
        //notify delegate
        delegate?.controller(self, didSelectColor: colorView.backgroundColor)
    }
    
}
