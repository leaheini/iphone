//
//  ViewController.swift
//  SDWebIMageAnimation
//
//  Created by hackeru on 30/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // download all images
        imageView.animationDuration = 1
        imageView.animationRepeatCount = 0
        
        let arr = [
            URL(string: "http://rapsinews.com/images/15369/33/153693345.jpg")!,
            URL(string: "http://jbhnews.com/wp-content/uploads/2015/09/zzz5.jpg")!,
            URL(string: "https://cdn1.benzinga.com/files/imagecache/story_image_685x375C/images/story/2012/google-485611_1920_27.jpg")!
        ]
        
        imageView.sd_setAnimationImages(with: arr)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

