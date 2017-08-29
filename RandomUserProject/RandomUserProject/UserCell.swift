//
//  UserCell.swift
//  RandomUserProject
//
//  Created by Leah Eini on 28/08/2017.
//  Copyright © 2017 leah.eini. All rights reserved.
//

import UIKit
import SDWebImage

extension Date{
    var age : Int{
        return Calendar.current.dateComponents([.year], from: self, to: Date()).year!
    }
}

class UserCell: UICollectionViewCell {
    
    @IBOutlet weak var faceImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var genderImageView: UIImageView!
    
    func configure(with user : User){
        nameLabel.text = user.fullName
        ageLabel.text = String(describing: user.dob?.age)
        
        faceImageView.image = nil
        if let url = user.picture?.thumbnail{
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
