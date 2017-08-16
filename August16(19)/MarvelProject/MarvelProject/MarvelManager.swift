//
//  MarvelManager.swift
//  MarvelProject
//
//  Created by hackeru on 16/08/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit
import CryptoSwift
import Alamofire

class MarvelManager: NSObject {
    
    static let manager = MarvelManager()
    
    private let baseURL = "https://gateway.marvel.com/v1/public/"
    private let privateKey = "b8fcab014172804adbe7c54f98068c0ec20eb6a5"
    private let publicKey = "aafca0489da97492acc924be7026a3f3"
    
    private func defaultParams() -> [String:Any]{
        // hash string = timestamp + privateKey + publicKey
        // the server want to get: timestamp, publicKey, hash
        let timestamp = Int(Date().timeIntervalSince1970)
        let hashString = "\(timestamp)" + privateKey + publicKey
        let md5String = hashString.md5()
        
        return [
            "hash":md5String,
            "apikey":publicKey,
            "ts":timestamp
        ]
    }
    
    func getCharacters(by name : String, completion : @escaping ([Character]?, Error?)->Void){
        
        let url = baseURL + "characters"
        
        var params = defaultParams()
        params["nameStartsWith"] = name
        
        Alamofire.request(url, method: .get, parameters: params).responseJSON { (dataRes) in
            
            guard let json = dataRes.result.value as? [String:Any] else{
                //notify about an error
                completion(nil, dataRes.error)
                return
            }
            
            guard let code = json["code"] as? Int else{
                return
            }
            
            guard code >= 200 && code <= 299 else{
                //http error
                let status = json["status"] as? String ?? ""
                let err = NSError(domain: "marvel", code: code, userInfo: [NSLocalizedDescriptionKey : status])
                completion(nil, err as Error)
                return
            }

            let data = json["data"] as? [String:Any] ?? [:]
            let results = data["results"] as? [[String:Any]] ?? []
            
            // flatMap do for loop and return array of Characters from the first argument
            let characters : [Character] = results.flatMap{ Character($0) }
            completion(characters, nil)

        }
        
    }
    
    
}
