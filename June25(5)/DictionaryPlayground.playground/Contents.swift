//: Playground - noun: a place where people can play

import UIKit

var _ages : [String : Int] = [:]
var ages : Dictionary<String,Int> = [
    "Leah": 35,
    "Sapir": 21,
    "Benny": 30
]

ages["Tzvi"] = 24

let bennys = ages["Benny"]
ages["Benny"] = 17
let el = ages["El"]

ages.removeValue(forKey: "Benny")
ages["tzvi"] = nil
ages

ages.updateValue(22, forKey: "Sapir")
ages

let allKeys = Array(ages.keys)
let allValues = Array(ages.values)

for (key,val) in ages{
    print(key + " is \(val) years old")
}

for t in ages{
    print(t.key)
    print(t.value)
}
//-----------------------------------------------------------------------------

//tar: Dictionary(key :String,value : String) -> Int  how many "b" in the Strings

func countB(_ dict : [String:String]) -> Int{
    var count : Int = 0
    /*
     for word in dict{
     for ch in word.key.lowercased().characters{
     if ch == "b"{
     count += 1
     }
     }
     
     for ch in word.value.lowercased().characters{
     if ch == "b"{
     count += 1
     }
     }
     }
     */
    
    // Beeny's ans
    for (key, val) in dict{
        let str = key+val
        for ch in str.characters{
            if ch == "b" || ch == "B"{
                count += 1
            }
        }
    }
    return count
}

let sampleDict : [String:String] = [
    "firstb_name":"benny",
    "last_name":"Berkovitz",
    "city":"Bnei Brak",
    "b_date":"13th feb 1990"
]

countB(sampleDict)
