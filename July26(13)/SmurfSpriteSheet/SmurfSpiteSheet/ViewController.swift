//
//  ViewController.swift
//  SmurfSpiteSheet
//
//  Created by hackeru on 26/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bigImage = #imageLiteral(resourceName: "smurf_sprite")   // the name from assets
        let arr = bigImage.cropSpriteSheet(rows: 4, columns: 4)
        
        imageView.image = arr.first
        imageView.animationImages = arr
        imageView.animationRepeatCount = 0  // ∞ repeat infinity
        imageView.animationDuration = 1  // 1 seconds
        
        //enable interaction
        imageView.isUserInteractionEnabled = true
        
        //setup tap gesture
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        imageView.addGestureRecognizer(tapGesture)
    }

    func tapAction(){
        if imageView.isAnimating{
            imageView.stopAnimating()
        } else {
          imageView.startAnimating()
        }
    }

}

