//
//  User.swift
//  RandomUserProject
//
//  Created by hackeru on 27/08/2017.
//  Copyright © 2017 leah.eini. All rights reserved.
//

import UIKit
//https://randomuser.me/documentation#errors
extension String{
    var toDate : Date?{
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter.date(from: self)
    }
}

class User: NSObject {
    class Picture{
        let large : URL?
        let medium : URL?
        let thumbnail : URL?
        
        init?(_ dict : [String:String]?) {
            guard let dict = dict else{
                return nil
            }
            self.large = URL(string: dict["large"] ?? "")
        }
    }
    
    enum Gender : String{
        case male = "male"
        case female = "female"
        case unknown = ""
    }
    let gender : Gender
    let fullName : String
    let location : [String:Any]
    let email : String
    let login : [String:String]
    let dob : Date?
    let registered : Date?
    let phone : String
    let cell : String
    let id : [String:String]
    //****
    let picture : Picture?
    let nat : String
    
    init(_ dict : [String:Any]) {
        if let genderStr = dict["gender"] as? String{
            self.gender = Gender(rawValue: genderStr) ?? .unknown
        } else {
            self.gender = .unknown
        }
        
        
        let nameDict = dict["name"] as? [String:String] ?? [:]
        self.fullName = Array(nameDict.values).joined(separator: " ")
        self.location = dict["location"] as? [String:Any] ?? [:]
        self.email = dict["email"] as? String ?? ""
        self.login = dict["login"] as? [String:String] ?? [:]
        if let dobStr = dict["dob"] as? String{
            self.dob = dobStr.toDate
        } else {
            self.dob = nil
        }
        self.registered = dict["registered"] as? Date ?? ""
        self.phone = dict["phone"] as? String ?? ""
        self.cell = dict["cell"] as? String ?? ""
        self.id = dict["id"] as? [String:String] ?? [:]
        
        self.picture = Picture(dict["picture"] as? [String:String])
        
        super.init()
    }
    

}