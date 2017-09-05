//
//  APIManager.swift
//  RandomUserProject
//
//  Created on 27/08/2017.
//  Copyright © 2017 leah.eini. All rights reserved.
//

import UIKit
import Alamofire
import Toaster

class APIManager: NSObject {
    static let manager = APIManager()
    
    private let baseURL = "https://randomuser.me/api/"
    
    typealias JSON = [String:Any]
    typealias DictionaryResultCompletion = ([JSON]?, Error?) -> Void
    
    private func sendGetRequest(params : JSON, completion : @escaping DictionaryResultCompletion){
        
        Alamofire.request(baseURL, method: .get, parameters: params).responseJSON { (dataRes) in
            
            guard let json = dataRes.result.value as? JSON else{
                //notify about the error
                Toast(text: "Error download the data", delay: Delay.short, duration: Delay.long).show()
                completion(nil, dataRes.error)
                return
            }
            
            let jsonArr = json["results"] as? [JSON] ?? []
            
            completion(jsonArr, nil)
        }
    }
    
    func getUsers(page : UInt, completion : @escaping ([User]?, Error?)->Void){
        
        var params : JSON = [:]
        params["page"] = page
        params["results"] = 25
        
        let gender = Settings.shared.gender
        if gender.shouldSend{
            params["gender"] = gender.stringVal
        }
        
        params["nat"] = Settings.shared.nat    //*******
        
        sendGetRequest(params : params) { (jsonArr, err) in
            let arr = jsonArr?.flatMap{ User($0) }
            completion(arr, err)
        }
    }

    
}
