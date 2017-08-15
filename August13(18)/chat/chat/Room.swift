
//
//  Room.swift
//  chat
//
//  Created by hackeru on 13/08/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import Firebase

extension Date{
    var toString : String{
        get{
            let formatter = DateFormatter()
            formatter.dateStyle = .medium
            formatter.timeStyle = .medium
            formatter.doesRelativeDateFormatting = true
            
            return formatter.string(from: self)
        }
    }
}

//present room from the firebase
class Room{
    let id : String
    var name : String?
    let owner : String?
    let date : Date?
    
    init(key: String, value : [String:Any]) {   // the key is the id of the room
        self.id = key
        self.name = value["name"] as? String
        self.owner = value["owner"] as? String
    
        if let timestamp = value["date"] as? TimeInterval{
            self.date = Date(timeIntervalSince1970: timestamp)
        } else {
            self.date = nil
        }
    }
}
