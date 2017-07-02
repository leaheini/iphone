//
//  ViewController.swift
//  AutoCompleteProject
//
//  Created by hackeru on 02/07/2017.
//  Copyright © 2017 Juda. All rights reserved.
//

import UIKit
import GooglePlaces

class ViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var googleAddressLabel: UILabel!
    
    let manager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager.requestWhenInUseAuthorization()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func getInfoAction(_ sender: Any) {
        GMSPlacesClient.shared().currentPlace { (list, error) in
            if let error = error {
                print(error)
                return
            }
            
            //result found
            guard let list = list else{
                return
            }
            
            // at least one place found
            guard let place = list.likelihoods.first?.place else{
                return
            }
            
            self.nameLabel.text = place.name
            self.googleAddressLabel.text = place.formattedAddress
        }
    }
    

}

