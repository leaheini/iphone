//
//  ViewController.swift
//  tarSuzukiSKPhotoBrowser
//
//  Created by hackeru on 26/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit
import SDWebImage
import SKPhotoBrowser

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func loadPicAction(_ sender: UIButton) {
        guard let url = URL(string:"http://www.tillymintsnurseries.co.uk/communities/8/004/010/680/198/images/4620639895.png") else {
            return
        }
        
        imageView.sd_setImage(with: url)
    }

//        var arr : [Int] = []
//        var arr2 = [Int]()
    
    @IBAction func tapAction(_ sender: Any) {
        guard let image = imageView.image else {
            return
        }
        
        let photo = SKPhoto.photoWithImage(image)
        let images = [photo]
        
        let browser = SKPhotoBrowser(photos: images)
        self.present(browser, animated: true, completion: nil)

    }
    
    
    @IBAction func showGalleryAction(_ sender: Any) {
        let urls : [String] = [
            "https://www.mykonosblanchotel.com/wp-content/uploads/2014/12/mykonos-blanc-home-slide01.jpg",
            "http://images.kuoni.co.uk/73/greco-philia-hotel-boutique-mykonos-40115647-1472724029-ImageGalleryLightboxLarge.jpg",
            "http://mykonos-town-suites.com/img/slide.jpg"
        ]
        
        var images : [SKPhoto] = []
        for str in urls{
            images.append(SKPhoto.photoWithImageURL(str))
        }
        
        let browser = SKPhotoBrowser(photos: images)
        browser.initializePageIndex(images.count / 2)  // start from middle pic
        self.present(browser, animated: true, completion: nil)
    }
}

