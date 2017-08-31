//
//  UserCell.swift
//  RandomUserProject
//
//  Created by Leah Eini on 28/08/2017.
//  Copyright © 2017 leah.eini. All rights reserved.
//

import UIKit
import SDWebImage

class UserCell: UICollectionViewCell {
    
    @IBOutlet weak var faceImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var genderImageView: UIImageView!
    
    func configure(with user : User){
        
        nameLabel.text = user.fullName
        
        if let age = user.dob?.age{
            ageLabel.text = "\(age)"
        } else {
            ageLabel.text = ""
        }        
        
        faceImageView.image = nil
        if let url = user.picture?.medium{
            faceImageView.sd_setImage(with: url)
        } else {
            faceImageView.sd_cancelCurrentImageLoad()
        }
        
        genderImageView.image = nil
        switch user.gender {
        case .male:
            genderImageView.image = #imageLiteral(resourceName: "icons8-male_filled")
        case .female:
            genderImageView.image = #imageLiteral(resourceName: "icons8-female_filled")
        default:
            genderImageView.image = nil
        }
    }
    
}
