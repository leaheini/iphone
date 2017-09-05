//
//  Settings.swift
//  RandomUserProject
//
//  Created by Benny Davidovitz on 03/09/2017.
//  Copyright © 2017 leah.eini. All rights reserved.
//

// https://developer.apple.com/documentation/foundation/userdefaults

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
    
    
    var nat : Int{
        set{
            let defaults = UserDefaults.standard
            defaults.setValue(???, forKey: "nat")  //*********
            defaults.synchronize()
            
            NotificationCenter.default.post(name: .nationalSettingsChanged, object: self)
        }
        get{
            let defaults = UserDefaults.standard
            return nat //*************
            
        }
    }

    
}
