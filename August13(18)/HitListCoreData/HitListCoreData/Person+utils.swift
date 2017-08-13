//
//  Person+utils.swift
//  HitListCoreData
//
//  Created by hackeru on 13/08/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import CoreData

extension Person{
    func surnameInitial() -> String?{
        self.willAccessValue(forKey: "surnameInitial")
        
        // to get the first letter in lastName
        guard let str = self.lastName, !str.isEmpty else{
            self.didAccessValue(forKey: "surnameInitial")
            return nil
        }
        
        let index = str.startIndex
        let char = str.uppercased()[index]
        
        self.didAccessValue(forKey: "surnameInitial")
        
        return "\(char)"
    }
}
