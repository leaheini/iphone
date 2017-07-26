//
//  ViewController.swift
//  ImageFromServer
//
//  Created by hackeru on 26/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {

    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    @IBOutlet weak var imageView: UIImageView!

    @IBAction func loadInageAction(_ sender: UIButton) {
        
        imageView.image = nil
        activityIndicatorView.startAnimating()
        sender.isEnabled = false

        let urlString = "https://hdwallpapersbuzz.com/wp-content/uploads/2017/02/whatsapp-wallpapers-images-57.jpg"
        guard let url = URL(string: urlString) else{   // guard cause its (?) optional
            debugPrint("url not valid")
            return
        }
        
        //clear cach for specific url
        //SDImageCache.shared().removeImage(forKey: urlString, fromDisk: true, withCompletion: nil)
        
        // clear all caches
        //SDImageCache.shared().clearMemory()
        
        
        //imageView.sd_setImage(with: url)
        imageView.sd_setImage(with: url) { (_, _, _, _) in
            self.activityIndicatorView.stopAnimating()
            sender.isEnabled = true
        }
        
    }
    
    // option 2 - not max well
    func betterThanNotNechmad(){
        //sender.isEnabled = false   // so cant click twice on load
        imageView.image = nil
        activityIndicatorView.startAnimating()
        
        let urlString = "https://hdwallpapersbuzz.com/wp-content/uploads/2017/02/whatsapp-wallpapers-images-57.jpg"
        guard let url = URL(string: urlString) else{   // guard cause its (?) optional
            debugPrint("url not valid")
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in   // running auto on background thread which no main
            guard let data = data else{
                print(error?.localizedDescription ?? "unknown error")
                return
            }
            
            let image = UIImage(data: data)
            DispatchQueue.main.async {
                //sender.isEnabled = true
                self.imageView.image = image
                self.activityIndicatorView.stopAnimating()
            }
            }.resume()

    }
    
    // option 1 - not nice
    func notNechmad(){
        let urlString = "https://hdwallpapersbuzz.com/wp-content/uploads/2017/02/whatsapp-wallpapers-images-57.jpg"
        guard let url = URL(string: urlString) else{   // guard cause its (?) optional
            debugPrint("url not valid")
            return
        }
        
        // go to background thread
        DispatchQueue.global().async {
            guard let data = try? Data(contentsOf: url) else{     // try? because it has throws    // guard to make sure no nil
                return
            }
            let image = UIImage(data: data)
            
            // go back to main thread
            DispatchQueue.main.async {
                self.imageView.image = image
            }
            
        }
        
    }

}

