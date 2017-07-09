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
        
        //add tap gesture to the smilies image view
        smilies.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapAction(_:))))
        
        // Do any additional setup after loading the view.
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
