//
//  CurrencyCell.swift
//  HwFlagsProject
//
//  Created by hackeru on 09/08/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class CurrencyCell: UITableViewCell {

    
    @IBOutlet var flagImageView: UIImageView!
    @IBOutlet var codeLabel: UILabel!
    @IBOutlet var valueLabel: UILabel!
    
    func configure(with currency : Currency){
        codeLabel.text = currency.code
        valueLabel.text = currency.value.description    // .description cause its flaut
        flagImageView.image = currency.image
    }
    
    /*   //// Benny delete this auto code
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
 */

}
