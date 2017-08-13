
//
//  PersonCell.swift
//  HitListCoreData
//
//  Created by hackeru on 09/08/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

extension Person{
    var fullname : String{
        get{
            var arr : [String] = []
            if let firstName = firstName {arr.append(firstName)}
            if let lastName = lastName {arr.append(lastName)}
            if isAlive{arr.append("💩")} else {arr.append("💀")}
            
            return arr.joined(separator: " ")
        }
    }
    
    var dateString : String{
        get{
            guard let date = self.createDate as Date? else {
                return ""
            }
            
            let formatter = DateFormatter()
            formatter.dateStyle = .medium
            formatter.doesRelativeDateFormatting = true
            return formatter.string(from: date)

        }
        
    }
}



class PersonCell: UITableViewCell {

    func configure(with person : Person){
        textLabel?.text = person.fullname
        detailTextLabel?.text = person.dateString
    }
    

}
