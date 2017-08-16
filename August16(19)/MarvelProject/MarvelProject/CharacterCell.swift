//
//  CharacterCell.swift
//  MarvelProject
//
//  Created by hackeru on 16/08/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit
import SDWebImage

class CharacterCell: UICollectionViewCell {
    
    @IBOutlet weak var label : UILabel!
    @IBOutlet weak var imageView : UIImageView!
    
    func configure(with char : Character){
        label.text = char.name
        
        imageView.image = nil
        if let url = char.thumbnailURL{
            imageView.sd_setImage(with: url)
        } else {
            imageView.sd_cancelCurrentImageLoad()
        }
    }
}
