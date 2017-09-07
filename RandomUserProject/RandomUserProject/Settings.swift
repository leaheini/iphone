//
//  Settings.swift
//  RandomUserProject
//
//  Created by Benny Davidovitz on 03/09/2017.
//  Copyright © 2017 leah.eini. All rights reserved.
//

// https://developer.apple.com/documentation/foundation/userdefaults  //save data
// https://gist.github.com/keeguon/2310008  // nationalities

import Foundation

extension Notification.Name{
    static var genderSettingsChanged : Notification.Name{
        get{
            return Notification.Name(rawValue: "gender_settings_changed_notification")
        }
    }
    
    static var nationalSettingsChanged : Notification.Name{
        get{
            return Notification.Name(rawValue: "national_settings_changed_notification")
        }
    }
}

class Settings{
    static var shared = Settings()
    
    struct Nationality {
        let name : String
        let code : String
        
        init?(_ dict : [String:Any]) {
            guard let name = dict["name"] as? String,
                let code = dict["code"] as? String else{
                    return nil
            }
            self.name = name
            self.code = code
        }
    }
    
    let allNationalities : [Nationality]
    
    init() {
        
        if let path = Bundle.main.path(forResource: "nat", ofType: "plist"),   // Internal file of all nationalities
            let arr = NSArray(contentsOfFile: path),
            let dictArr = arr as? [[String:Any]]{
            
            self.allNationalities = dictArr.flatMap{ Nationality($0) }
            
        } else {
            self.allNationalities = []
        }
        
    }
    
    enum Gender : Int{
        case female
        case male
        case all
        
        var stringVal : String{
            switch self {
            case .male:
                return "male"
            case .female:
                return "female"
            case .all:
                return "all"
            }
        }
        
        var shouldSend : Bool{
            get{
                switch self {
                case .male: return true
                case .female: return true
                case .all: return false
                }
            }
        }
        
    }
    
    
    var gender : Gender{
        set{
            let defaults = UserDefaults.standard
            defaults.setValue(newValue.rawValue, forKey: "gender")
            defaults.synchronize()
            
            NotificationCenter.default.post(name: .genderSettingsChanged, object: self)
        }
        get{
            let defaults = UserDefaults.standard
            if let intVal = defaults.value(forKey: "gender") as? Int{
                return Gender(rawValue: intVal) ?? .all
            } else {
                return .all
            }
            
        }
    }
    
    
    var natCode : String?{  //*********
        set{
            let defaults = UserDefaults.standard
            defaults.setValue(newValue, forKey: "nat")
            defaults.synchronize()
            
            NotificationCenter.default.post(name: .nationalSettingsChanged, object: self)
        }
        get{
            let defaults = UserDefaults.standard
            guard let stringVal = defaults.value(forKey: "nat") as? String else{
                return nil
            }
            return stringVal
        }
    }

    func nationallityFor(code : String) -> Nationality?{
        
        return allNationalities.first(where: {
            $0.code == code
        })
        
    }
    
}
