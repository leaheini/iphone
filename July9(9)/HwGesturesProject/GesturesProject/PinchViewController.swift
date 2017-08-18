//
//  PinchViewController.swift
//  GesturesProject
//
//  Created by hackeru on 09/07/2017.
//  Copyright © 2017 Leah. All rights reserved.
//

import UIKit

class PinchViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func pinchGestureAction(_ sender: UIPinchGestureRecognizer) {
        switch sender.state {
        case .changed ,.began:
            let scale = max(sender.scale,0.3)   // so wont be too tiny
            //sender.view?.transform = CGAffineTransform(scaleX: sender.scale, y: sender.scale)
            sender.view?.transform = CGAffineTransform(scaleX: scale, y: scale)
        case .ended:
            UIView.animate(withDuration: 0.5, animations: {
                sender.view?.transform = .identity    //initialize to origin position in 0.5 seconds
            })
        default:
            return
        }
    }
    
}
