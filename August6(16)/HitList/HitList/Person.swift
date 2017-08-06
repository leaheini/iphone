//
//  Person.swift
//  HitList
//
//  Created by hackeru on 06/08/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class Person: NSObject {
    let name : String
    let date : Date

    init(name : String) {
        self.name = name
        self.date = Date()
        
        super.init()
    }
}
