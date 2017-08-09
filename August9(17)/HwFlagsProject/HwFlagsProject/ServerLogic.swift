//
//  ServerLogic.swift
//  HwFlagsProject
//
//  Created by hackeru on 09/08/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit
import Alamofire

class ServerLogic: NSObject {
    static let shared = ServerLogic()   // = shared instanced mean we can call him from ServerLogic.shared
    
    let baseUrl = "https://api.fixer.io/latest"

    typealias Completion = ([Currency], String) -> Void   // typealias is new name to something
    
    func getCurrencies(with base : String, _ completion : @escaping Completion){
        Alamofire.request(baseUrl, method: .get, parameters: ["base":base]).responseJSON{
            guard let result = $0.result.value as? [String:Any] else{
                completion([],"")  // call the func that getCurrencies get
                return
            }
            
            let date = result["date"] as? String ?? ""
            let rates = result["rates"] as? [String:Double] ?? [:]
            let arr = rates.flatMap({
                Currency(code: $0.key, value: $0.value)
            })
            
            completion(arr,date)   // arr = $0,  date = $1
        }
    }
    
    
}
