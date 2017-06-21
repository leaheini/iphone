//: Playground - noun: a place where people can play

import UIKit

enum PrintType{
    case ink
    case lazer, threeDim
    
    static let count = 3   //for us to knpw how many vars in enum
    
    func cost() -> Double{
        switch self {
        case .ink:
            return 1.5
        case .lazer, .threeDim:
            return 0.3
        }
    }
}

let p = PrintType.ink
var p1 : PrintType = .lazer
p1.cost()
if p == .threeDim{
    
}

var p3 : PrintType?
var arr : [PrintType] = [p,p1]
//---------------------------------------------------------

enum Days : Int{
    case sunday = 1
    case monday
    case tuesday
    case wensday
    case thursday
    case friday //= 10
    case saturday
    
    func nextDay() -> Days{
        if let next = Days(rawValue: self.rawValue + 1){
            return next
        }else{
            return .sunday
        }
        
        //return Days(rawValue: self.rawValue + 1) ?? .sunday       //in one row
    }
    
    func prevDay() -> Days{
        if let prev = Days(rawValue: self.rawValue - 1){
            return prev
        }else{
            return .saturday
        }
    }
    
    func theDayToday() -> String{
        return String(describing: self)
    }
    
    func displayName( ) -> String{
        switch self {
        case .sunday: return "יום ראשון"
        case .monday: return "שני"
        case .tuesday: return "שלישי"
        case .wensday: return "רביעי"
        case .thursday: return "חמישי"
        case .friday: return "שישי"
        case .saturday: return "שבת😚"
        }
    }
    
}

let d1 : Days = .thursday
d1.rawValue
d1.nextDay()
Days.friday.nextDay().nextDay()
d1.theDayToday()

Days.saturday.rawValue

let d2 : Days? = Days(rawValue: 2)     // type of d2 optional Days

/*
let myNum : Int = 4
switch myNum {
case 0:
case 1, 2:
case 3...10:
case 11...Int.max:
default:
}*/

//---------------------------------------------------------------------------

Date()
let now : TimeInterval = Date().timeIntervalSince1970
let date1 = Date(timeInterval: 86_400, since: Date())
let date2 = Date(timeIntervalSince1970: 130_000_000)

func weekDay(from date : Date) -> Days{
    let calendar = Calendar.current
    let weekday = calendar.component(.weekday, from: date)
    return Days(rawValue: weekday)!
    
    let comps : DateComponents = calendar.dateComponents([.day, .weekday], from: date)
}

weekDay(from: date2)
weekDay(from: Date()).displayName()

extension Date{
    func isFirday13th() -> Bool{
        
        let calendar =  Calendar.current
        let comps : DateComponents = calendar.dateComponents([.day, .weekday], from: self)
        return comps.day == 13 && comps.weekday == 6
    }
}

Date(timeIntervalSince1970: 1484305834).isFirday13th()   // in one row
let testDate = Date(timeIntervalSince1970: 1484305834)
testDate.isFirday13th()

let cal = Calendar(identifier: .hebrew)

let formatter = DateFormatter()
formatter.dateStyle = .medium    //.full
formatter.dateFormat = "dd-MM-yyyy HH:mm"
formatter.string(from: testDate)
let date3: Date? = formatter.date(from: "01-04-2017 16:00")

let hebFormatter = DateFormatter()
hebFormatter.calendar = Calendar(identifier: .hebrew)
hebFormatter.locale = Locale(identifier: "he")
hebFormatter.dateStyle = .full
hebFormatter.string(from: date3!)




