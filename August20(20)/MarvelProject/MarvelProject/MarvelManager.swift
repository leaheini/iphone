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
    
    private func defaultParams() -> JSON{           // JSON = [String:Any]
        // hash string = timestamp + privateKey + publicKey
        let timestamp = Int(Date().timeIntervalSince1970)
        let hashString = "\(timestamp)" + privateKey + publicKey
        let md5String = hashString.md5()   //לקבל קוד מוצפן
        
        // the server want to get: timestamp, publicKey, hash        
        return [
            "hash":md5String,
            "apikey":publicKey,
            "ts":timestamp
        ]
    }
    
    
    typealias JSON = [String:Any]   //typealias = to give something long one short name
    typealias DictionaryResultCompletion = ([JSON]?, Error?) -> Void
    private func sendGetRequest(endPoint : String,    // the end to the URL
                                params : [String:Any],
                                completion : @escaping DictionaryResultCompletion){

        let url = baseURL + endPoint
        
        Alamofire.request(url, method: .get, parameters: params).responseJSON { (dataRes) in
            
            guard let json = dataRes.result.value as? JSON else{
                //notify about an error
                completion(nil, dataRes.error)
                return
            }
            
            // sucsses code '200'
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
            
            let data = json["data"] as? JSON ?? [:]
            let jsonArr = data["results"] as? [JSON] ?? []
            
            completion(jsonArr, nil)
            
        }
    }
    
    func getCharacters(by name : String,
                        recsPerPage : UInt, //bigger than 0
                        page : UInt,  //0 or bigger
                        completion : @escaping ([Character]?, Error?)->Void){
        
        //let url = baseURL + "characters"
        
        var params = defaultParams()
        params["nameStartsWith"] = name
        params["limit"] = recsPerPage
        params["offset"] = recsPerPage * page
        
        // flatMap do forLoop and return array of Characters from the first argument
        //let characters : [Character] = results.flatMap{ Character($0) }
        
        sendGetRequest(endPoint: "characters", params: params) { (jsonArr, err) in
            let arr = jsonArr?.flatMap{ Character($0) }
            completion(arr, err)
        }
    }
    
    func getComicsFor(charId : String,
                      completion : @escaping ([Comic]?, Error?) -> Void){
        
        let endPoint = "characters/" + charId + "/comics"
        let params = self.defaultParams()
        
        sendGetRequest(endPoint: endPoint, params: params) { (jsonArr, err) in
            let arr = jsonArr?.flatMap{ Comic($0) }
            completion(arr, err)
        }
        
    }
    
}
