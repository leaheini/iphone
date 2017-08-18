//
//  ColorPickerViewController.swift
//  TraingleHomework
//
//  Created by hackeru on 16/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

protocol ColorPickerViewControllerDelegate {
    // method which tell the delegate (the influenced controller) about the choosen color
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
        
        if let startColor = startColor{
            var red  : CGFloat = 0
            var green : CGFloat = 0
            var blue : CGFloat = 0
            var alpha : CGFloat = 0
            startColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
            
            redSlider.value = Float(red)
            greenSlider.value = Float(green)
            blueSlider.value = Float(blue)
        }
        
        //init the color like the slider
        sliderAction(redSlider)
        //redSlider.sendActions(for: .valueChanged)    //or
    }
    
    //MARK: - IBAction Methods -
    
    @IBAction func sliderAction(_ sender: UISlider) {
        
        let red = CGFloat(redSlider.value)
        let green = CGFloat(greenSlider.value)
        let blue = CGFloat(blueSlider.value)
        
        colorView.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
    }
    
    @IBAction func doneAction(_ sender: Any) {
        
        //go back - finish
        self.dismiss(animated: true, completion: nil)
        
        //notify delegate
        delegate?.controller(self, didSelectColor: colorView.backgroundColor)
    }
    
}
