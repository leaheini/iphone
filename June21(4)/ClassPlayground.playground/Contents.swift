//: Playground - noun: a place where people can play

import UIKit

class MyClass{
    var str = ""
    var str1 : String = ""
    var str2 : String?
    
    func doSomething(){
        
    }
    
    func returnSomething() -> Int{
        return 1
    }
    
}

class MySubClass : MyClass{
    override func returnSomething() -> Int {
        return super.returnSomething() + 1
    }
}

let obj1 = MyClass()
obj1.str
obj1.str = "aaa"
obj1.str

let obj2 = MySubClass()
obj2.str1

obj1.doSomething()
obj2.returnSomething()
//---------------------------------------------------

class Person {
    var name : String
    
    init() {
        name = "John Doe"
    }
    
    init(name : String /* = "John Doe" */){
        self.name = name
    }
}

let p = Person()
p.name
let p1 = Person(name: "A B")
//-----------------------------------------------------------
extension Date{
    /// Returns the amount of years from another date
    func years(to date: Date) -> Int {
        return Calendar.current.dateComponents([.year], from: self, to: date).year ?? 0
    }
}

class Child : NSObject{
    var firstName : String
    var lastName: String
    let birthDate : Date
    var age : Int{
        get{
            let now = Date()
            return birthDate.years(to: now)
        }
    }

    var fullName : String{        // better than the func
        get{
            return firstName + " " + lastName
        }
        set (newFullName){
            //newValue
            let arr = newFullName.components(separatedBy: " ")
            guard arr.count == 2 else {
                return
            }
            self.firstName = arr[0]     //arr.first ?? ""
            self.lastName = arr[1]     //arr.last ?? ""
        }
    }
    
    init(firstName : String, lastName : String, birthDate : Date){
        self.firstName = firstName
        self.lastName = lastName
        self.birthDate = birthDate
        
        super.init()
    }
    
    /*
    func fullName() -> String {
        return firstName + " " + lastName
    }*/
    
}

//let c = Child(firstName: "Leah", lastName: "Eini")
let date = Date(timeIntervalSince1970: 123_456_789)
let c = Child(firstName: "Roni", lastName: "Eini", birthDate: date)
c.fullName
c.age
c.fullName = "bela bla"
c.firstName
c.lastName
    
//------------------------------------------------------------------
extension String{
    var isValidCode : Bool{
        get{
            return self.characters.count == 4
        }
    }
}

let myStr = "1234"
myStr.isValidCode
