//
//  SettingsViewController.swift
//  RandomUserProject
//
//  Created by hackeru on 30/08/2017.
//  Copyright © 2017 leah.eini. All rights reserved.
//

import UIKit

// https://stackoverflow.com/questions/29086961/ios-swift-defining-own-app-settings-in-own-class
// https://developer.apple.com/documentation/foundation/userdefaults


class SettingsViewController: UIViewController {

    enum ConvertType : Int{
        case female  //0
        case male  //1
        case all  //2     //*** wont get all only ""
        
        static let count = 2
        
    }

    var type : ConvertType = .all
    
    @IBOutlet weak var genderSegmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        genderSegmentetControlAction(genderSegmentedControl)
        
    }

    @IBAction func genderSegmentetControlAction(_ sender: UISegmentedControl) {
        
        let index : Int = sender.selectedSegmentIndex
        guard let t = ConvertType(rawValue: index) else {
            // todo taost
            print("unsupported index \(index)")
            return
        }
        
        self.type = t
        
        /*
        UserDefaults.standard.register(defaults: [
            "gender": type
            ])
 */
        
        //GalleryViewController.reload()
        //APIManager.manager.getUsers(page: page, gender: type, completion: completion)
    }
    

}
