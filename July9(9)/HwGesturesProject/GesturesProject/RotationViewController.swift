//
//  RotationViewController.swift
//  GesturesProject
//
//  Created by hackeru on 09/07/2017.
//  Copyright © 2017 Leah. All rights reserved.
//

import UIKit

class RotationViewController: UIViewController {
    
    @IBOutlet var stars: [UIImageView]!      // outlet collection, all little purple stars connected to it
    var activeTimer : Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func timerButtonAction(_ sender: Any) {
        // to stop the timer at the second click on the btn
        if let timer = self.activeTimer{     // if timer is on, meaning not nil
            timer.invalidate()               // make the timer invalid
            self.activeTimer = nil           // no reference to the timer
            return
        }
        
        //when click on btn and timer is off
        self.activeTimer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            //code to execute by timer according to definations
            //debugPrint("time done")
            
            let angle = CGFloat.pi * 1 / 16       // moving 180 / 16 degree     ->    positive - so move to right
            for obj in self.stars{
                let newTransform = obj.transform.rotated(by: angle)
                obj.transform = newTransform
            }
        }
    }
    
    @IBAction func rotationAction(_ sender: UIRotationGestureRecognizer) {
        //bug - not good
        //sender.view?.transform = CGAffineTransform(rotationAngle: sender.rotation)
        
        guard let imageView = sender.view else {      // check the view under the gesture is not nil
            return
        }
        
        let newTransform = imageView.transform.rotated(by: sender.rotation)
        imageView.transform = newTransform
        
        // stars = the purple little stars
        for obj in stars{
            let t = obj.transform.rotated(by: sender.rotation)    // sender is the gesture which on the magen david
            obj.transform = t     // the little stars will move acording to the timer + the move of the magen david
        }
        
        sender.rotation = 0   // initialize so wont be the bug
        debugPrint(sender.rotation)
    }
    
}
