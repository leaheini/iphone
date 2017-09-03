//
//  Settings.swift
//  RandomUserProject
//
//  Created by Benny Davidovitz on 03/09/2017.
//  Copyright © 2017 leah.eini. All rights reserved.
//

import Foundation

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
}
