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
        
        // Do any additional setup after loading the view.
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
