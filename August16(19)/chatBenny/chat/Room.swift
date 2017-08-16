//
//  Room.swift
//  chat
//
//  Created by Benny Davidovitz on 13/08/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import Firebase



class Room{
    let id : String
    let name : String?
    let owner : String?
    let date : Date?
    
    init(key : String, value : [String:Any]) {
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













