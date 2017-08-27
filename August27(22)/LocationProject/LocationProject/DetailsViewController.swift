//
//  DetailsViewController.swift
//  LocationProject
//
//  Created by Benny Davidovitz on 27/08/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    var branch : Branch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = branch.name
    }

    @IBAction func wazeAction(_ sender: Any) {
        
        let lat = branch.coordinate.latitude
        let lon = branch.coordinate.longitude
        let urlString = "waze://?ll=\(lat),\(lon)&navigate=yes"
        
        guard let url = URL(string: urlString) else{
            return
        }
        
        guard UIApplication.shared.canOpenURL(url) else{
            print("waze not installed")
            return
        }
        
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
        
        
    }
    
}










