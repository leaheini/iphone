//
//  Utils.swift
//  RandomUserProject
//
//  Created by hackeru on 30/08/2017.
//  Copyright © 2017 leah.eini. All rights reserved.
//

import Foundation

extension String{
    var toDate : Date?{
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter.date(from: self)
    }
}


extension Date{
    
    var age : Int{
        return Calendar.current.dateComponents([.year], from: self, to: Date()).year!
    }
    
    var toString : String?{
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: self)
    }
}
