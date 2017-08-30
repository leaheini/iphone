//
//  DetailsViewController.swift
//  RandomUserProject
//
//  Created by leah on 30/08/2017.
//  Copyright © 2017 leah.eini. All rights reserved.
//

import UIKit
import SDWebImage

class DetailsViewController: UIViewController {
    
    @IBOutlet var faceImageView: UIImageView!
    @IBOutlet var ageLabel: UILabel!
    @IBOutlet var nameTextView: UITextView!
    @IBOutlet var genderImageView: UIImageView!
    
    @IBOutlet var dobLabel: UILabel!
    @IBOutlet var registeredLabel: UILabel!
    @IBOutlet var natLabel: UILabel!
    
    var user : User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        faceImageView.image = nil
        if let url = user.picture?.large{
            faceImageView.sd_setImage(with: url)
        } else {
            faceImageView.sd_cancelCurrentImageLoad()
        }
        
        if let age = user.dob?.age{
            ageLabel.text = "\(age)"
        } else {
            ageLabel.text = ""
        }
        
        nameTextView.text = user.fullName

        genderImageView.image = nil
        switch user.gender {
        case .male:
            genderImageView.image = #imageLiteral(resourceName: "icons8-male_filled")
        case .female:
            genderImageView.image = #imageLiteral(resourceName: "icons8-female_filled")
        default:
            genderImageView.image = nil
        }
        
        if 
        dobLabel.text = "Date of birth: " + user.dob?.toString
        registeredLabel.text = "Member since: " + user.registered?.toString
        
        natLabel.text = "National: " + user.nat
        
        
        
    }

    @IBAction func locationAction(_ sender: UIButton) {
        
    }
   
    @IBAction func emailAction(_ sender: UIButton) {
        
    }
    
    @IBAction func callAction(_ sender: UIButton) {
        
    }
    

}
