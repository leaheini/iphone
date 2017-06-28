//: Playground - noun: a place where people can play

import UIKit

class Person{
    let firstName : String
    let lastName : String
    let middleName : String?
    let birthdate : Date
    
    var fullName : String{
        get{
            //we create array of String if no name so wont be double "  "
            var arr : [String] = []
            if firstName.isEmpty == false{
                arr.append(firstName)
            }
            
            if let middleName = middleName, !middleName.isEmpty{
                arr.append(middleName)
            }
            
            if lastName.isEmpty == false{
                arr.append(lastName)
            }
            
            return arr.joined(separator: " ")
        }
    }
    
    var age : Int{
        get{
            return age(using: .current)
        }
    }
    
    var canVote : Bool{
        get{
            if age(using: Calendar(identifier: .hebrew)) >= 18{
                return true
            }
            
            if age(using: Calendar(identifier: .gregorian)) >= 18{
                return true
            }
            return false
        }
    }
    
    private func age(using calendar : Calendar) -> Int{
        let now = Date()
        let comp : DateComponents = calendar.dateComponents([.year], from: self.birthdate, to: now)
        
        return abs(comp.year!)   // or (comp.year ?? 0)
    }
    
    init(_ dict : [String:Any]){
        self.firstName = dict["first_name"] as? String ?? ""
        self.lastName = dict["last_name"] as? String ?? ""
        self.middleName = dict["middle_name"] as? String    // is optional so can be nil
        let timestamp = dict["birthdate"] as? TimeInterval ?? 0
        self.birthdate = Date(timeIntervalSince1970: timestamp)
    }
}

let dict : [String:Any] = [
    "first_name":"John",
    "last_name":"Snow",
    "middle_name":"u know nothing",
    "birthdate":940553701.026924
]

let bastard = Person(dict)
bastard.birthdate
bastard.fullName
bastard.canVote

let gregCal = Calendar(identifier: .gregorian)
let testDate = gregCal.date(byAdding: .year, value: -18, to: Date())   // return optional date
let formatter = DateFormatter()
formatter.calendar = Calendar(identifier: .hebrew)
formatter.dateStyle = .medium
formatter.string(from: testDate!)  // more 10 days from today will be 18

testDate?.timeIntervalSince1970