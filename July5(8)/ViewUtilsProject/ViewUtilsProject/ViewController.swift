//
//  ViewController.swift
//  ViewUtilsProject
//
//  Created by hackeru on 05/07/2017.
//  Copyright © 2017 Leah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var uiView: UIView!
    @IBOutlet weak var hideSwitch: UISwitch!
    @IBOutlet weak var alphaSlider: UISlider!
    
    @IBAction func isHiddenAction(_ sender: UISwitch) {
        /*
        if sender.isOn{
            uiView.isHidden = false
        }else{
            uiView.isHidden = true
        }*/
        uiView.isHidden = !sender.isOn
        alphaSlider.isHidden = !sender.isOn
    }
    
    @IBAction func alphaSliderAction(_ sender: UISlider) {
        uiView.alpha = CGFloat(sender.value)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //uiView.isHidden = true
        hideSwitch.sendActions(for: .valueChanged)
        //isHiddenAction(hideSwitch)
        
        //to initialize the start value from slider to UIView
        alphaSliderAction(alphaSlider)
        
        //adding background
        let imageView = UIImageView(frame: self.view.bounds)
        imageView.image = #imageLiteral(resourceName: "background")
        
        //self.view.addSubview(imageView)
        //view.sendSubview(toBack: imageView)    //put background behind
        
        //or instead of the 2 sentences
        self.view.insertSubview(imageView, at: 0)    //layer 0
    }
    
    @IBAction func alphaBackgroundAction(_ sender: UISlider) {
        uiView.backgroundColor = uiView.backgroundColor?.withAlphaComponent(CGFloat(sender.value))
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        print(#function)
    }
    
    @IBAction func switchAction2(_ sender: UISwitch) {
        uiView.isUserInteractionEnabled = sender.isOn
    }
    
}

