//: Playground - noun: a place where people can play

import UIKit

class AirPlane{
    static let maxHeight : Double = 1_000
    
    var height : Double = 0
    
    class func fleet() -> [AirPlane]{
        return [AirPlane(), AirPlane()]
    }
}

let arr = AirPlane.fleet()
AirPlane.maxHeight

enum Direction{
    case left, right
    case up, down
    
    static let count : Int = 4
}

class DBManager{
    static let manager = DBManager()
    
    func save(){
        
    }
}

DBManager.manager.save()

UIColor.red