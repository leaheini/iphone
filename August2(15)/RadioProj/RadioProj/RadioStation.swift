//
//  RadioStation.swift
//  RadioProj
//
//  Created by hackeru on 02/08/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class RadioStation: NSObject {
    
    let name : String?
    let url : URL?
    
    init(_ dict : [String:Any]) {
        self.name = dict["name"] as? String
        
        if let str = dict["url"] as? String{
            self.url = URL(string: str)
        } else {
            self.url = nil
        }
        
        super.init()
    }
    
    class func readFile() -> [RadioStation]{
        // validate file exist by retrieving its path
        guard let path = Bundle.main.path(forResource: "Stations", ofType: "plist") else {
            print("no file found")
            return []
        }
        
        //make sure the file is an array
        guard let rawArr = NSArray(contentsOfFile: path) else {
            print ("file exist but not array type")
            return []
        }
        
        //make sure that array is in relevant format
        guard let arr = rawArr as? [[String:Any]] else {
            print("array is not array of dictionaries")
            return []
        }
        
        //iterate each dictionary to radioStation object
        var result : [RadioStation] = []
        
        for dict in arr{
            let s = RadioStation(dict)
            result.append(s)
        }
        
        //return result
        return result
        
        // or shortly instead of rows 47-56
        //return arr.flatMap { RadioStation($0)}
    }
    
}
