//: Playground - noun: a place where people can play

import UIKit

// a Dictionary to represent a person data: firstname, lastname, middlename, birthdate (Date), gender (Bool) //false=male

//let dict : Dictionary<String,Any> = [
let dict : [String:Any] = [
    "firstname":"Benny",
    "lastname":"Berkovits",
    "birthdate":702909559.0,
    "gender":false
]

// create a class (Person) to represent the data. Then, add a support init method

class Person{
    var firstname : String
    var lastname : String
    var middlename : String?    // ? meaning not forced
    let birthdate : Date
    var gender : Bool
   
    /*
    var fullname : String{     // compoted property
        get{
            
        }
    }
    
    var age : Int{
        get{
            
        }
    }
    
    var canVote : Bool{
        get{
            
        }
    }
 */
    
    init(_ dict : [String:Any]){
        self.firstname = dict["firstname"] as? String ?? ""   // casting cause the value any
        self.lastname = dict["lastname"] as? String ?? ""
        self.middlename = dict["middlename"] as? String   // cause he optional => can be nil
        
        let timestamp = dict["birthdate"] as? TimeInterval ?? 0         //Double
        self.birthdate = Date(timeIntervalSince1970: timestamp)
        
        self.gender = dict["gender"] as? Bool ?? false
    }
}

let p = Person(dict)
p.birthdate
p.firstname
p.middlename
p.gender
p.lastname
