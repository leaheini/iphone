//
//  PersonCell.swift
//  HitList
//
//  Created by hackeru on 06/08/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

extension Date{
    var string : String{
        get{
            let formatter = DateFormatter()
            formatter.dateStyle = .medium
            formatter.timeStyle = .medium
            
            formatter.doesRelativeDateFormatting = true // writing today, tomorrow, yesterday...
            
            return formatter.string(from: self)
        }
    }
}

class PersonCell: UITableViewCell {

    @IBOutlet var namelabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    func configure(with person : Person){
        namelabel.text = person.name
        dateLabel.text = person.date.string
    }

}
