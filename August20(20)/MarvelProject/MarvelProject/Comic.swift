//
//  Comic.swift
//  MarvelProject
//
//  Created by hackeru on 20/08/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit


class Comic: NSObject {
    // for any comic at the marvel site the parametrs are:
    let id : Int
    let digitalId : Int
    let title : String?
    let purchaseURL : URL?
    
    init?(_ dict : MarvelManager.JSON) {
        guard let id = dict["id"] as? Int,
                let digitalId = dict["digitalId"] as? Int else {
                    return nil
        }
        
        self.id = id
        self.digitalId = digitalId
        
        self.title = dict["title"] as? String
        
        let urls = dict["urls"] as? [MarvelManager.JSON] ?? []
        //returns many
        //urls.filter(<#T##isIncluded: ([String : Any]) throws -> Bool##([String : Any]) throws -> Bool#>)
        
        //returns one
        //urls.first(where: <#T##([String : Any]) throws -> Bool#>)
        let pDictionary = urls.first{ $0["type"] as? String == "purchase" }
        if let str = pDictionary?["url"] as? String{
            self.purchaseURL = URL(string: str)
        } else {
            self.purchaseURL = nil
        }
        
        /* take from facebook
        //2 כתיבה מקוצרת
        self.purchaseURL = urls.flatMap(<#T##transform: ([String : Any]) throws -> ElementOfResult?##([String : Any]) throws -> ElementOfResult?#>)
        
        self.purchaseURL = urls.filter({ $0["type"] as? String == "purchase"
        })
     */
    }
    
}
