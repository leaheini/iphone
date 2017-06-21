//: Playground - noun: a place where people can play

import UIKit

extension String{
    
    func isPolindrom(_ insensative : Bool = false) -> Bool{
        let count = self.characters.count
        if count == 1 || count == 0{
            return true
        }
        
        var str = self
        if insensative{    // only at the first time true, so will do it only once
            str = str.lowercased()
        }

        if str.characters.first != str.characters.last{
            return false
        }
        
        str.characters.removeFirst()
        str.characters.removeLast()
        
        return str.isPolindrom()    // recorsive on the same word, sent (false) by default
    }
}

//let myStr = "koK"
//myStr.isPolindrom(true)

func checkPolindromQuantity(_ str : String) -> Int{
    var sum = 0
    
    let arr = str.components(separatedBy: " ")
    for word in arr{
        if word.isPolindrom(true) && word.isEmpty == false{
            sum += 1
        }
    }
    
    return sum
}

var para = "Aba 121 Ima " + "אבא" + "      " + "😍X😍"
checkPolindromQuantity(para)

let testTSTR = "a,2,3$4"
let charSet = CharacterSet(charactersIn: ",$")
testTSTR.components(separatedBy: charSet)


