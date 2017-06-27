//: Playground - noun: a place where people can play

import UIKit

// a Dictionary to represent a person data: firstname, lastname, middlename, birthdate (Date), gender (Bool) //false=male

//let dict : Dictionary<String,Any> = [
let dict : [String:Any] = [
    "firstname":"Benny",
    "lastname":"Berkovits",
    //"middlename":"bla",
    "birthdate":926812800.0,
    "gender":false
]

// create a class (Person) to represent the data. Then, add a support init method

class Person{
    var firstname : String
    var lastname : String
    var middlename : String?    // ? meaning can be nil if someone doesn't have middlename
    let birthdate : Date
    var gender : Bool
   
    
    var fullname : String{     // compoted property
        get{
            return("\(firstname) \(middlename ?? "") \(lastname)")
        }
    }
  
    let now = Date()
    
    
    var age : Int{
        get{
            let calendar = Calendar.current
            let ageComponents = calendar.dateComponents([.year], from: birthdate, to: now)
            let age = ageComponents.year!
            return(age)
        }
    }
    
    var canVote : Bool{
        get{
            let hebCal = Calendar(identifier: .hebrew)
            let hebAgeComponents = hebCal.dateComponents([.year], from: birthdate, to: now)
            let hebAge = hebAgeComponents.year!
            return age >= 18 || hebAge >= 18 ? true : false
        }
    }

    
    init(_ dict : [String:Any]){
        self.firstname = dict["firstname"] as? String ?? ""   // casting cause the value Any, if nil put ""
        self.lastname = dict["lastname"] as? String ?? ""
        self.middlename = dict["middlename"] as? String   // cause it optional => can be nil
        
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
p.fullname
p.age
p.canVote