//
//  PanViewController.swift
//  GesturesProject
//
//  Created by hackeru on 09/07/2017.
//  Copyright © 2017 Leah. All rights reserved.
//

import UIKit

class PanViewController: UIViewController {
    
    @IBOutlet weak var smilies: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //adding pan gesture progomatically
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panAction(_:)))
        smilies.addGestureRecognizer(panGesture)
        
        //add also tap gesture to the smilies image view
        smilies.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapAction(_:))))
    }
    
    //the tap func
    func tapAction(_ sender : UITapGestureRecognizer){
        if sender.view?.backgroundColor == .blue{
            sender.view?.backgroundColor = .red
        } else{
            sender.view?.backgroundColor = .blue
        }
    }
    
    @IBAction func panAction(_ sender: UIPanGestureRecognizer) {
        // checking the image isnt nil
        guard let imageView = sender.view else {             //sender.view ->cause we put the pan gesture on the imageview
            return
        }
        
        imageView.center = sender.location(in: self.view)   //the location of the pan in the view controller
    }
    
}
