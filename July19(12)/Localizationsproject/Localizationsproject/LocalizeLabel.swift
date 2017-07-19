//
//  LocalizeLabel.swift
//  Localizationsproject
//
//  Created by hackeru on 19/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class LocalizeLabel: UILabel {

    @IBInspectable var localizeKey : String?{
        didSet{
            if let localizeKey = localizeKey{
                self.text = localizeKey.localizedString
            }
        }
    }
    
    // like viewDidLoad
    override func awakeFromNib() {
        super.awakeFromNib()
        
        if let localizeKey = localizeKey{
            self.text = localizeKey.localizedString
        }
    }
}
