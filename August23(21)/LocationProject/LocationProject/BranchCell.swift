//
//  BranchCell.swift
//  LocationProject
//
//  Created by hackeru on 27/08/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class BranchCell: UITableViewCell {

    @IBOutlet weak var nameLabel : UILabel!
    @IBOutlet weak var distanceLabel : UILabel!
    
    func configure(with branch : Branch){
        nameLabel.text = branch.name
        
        if let distance = branch.distance{
            distanceLabel.text = String(format: "%.2f km", distance / 1000)
        }else{
            distanceLabel.text = ""
        }
    }

}
