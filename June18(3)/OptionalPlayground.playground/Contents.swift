//: Playground - noun: a place where people can play

import UIKit

var str = "123a"
let numm : Int? = Int(str)

func findIndex(_ arr : [Int], value : Int) -> Int?{
    for i in 0..<arr.count{
        if arr[i] == value{
            return i
        }
    }
    
    return nil
}

var num  = findIndex([1,2,3], value: 4)
if num != nil{
    num! += 1
}

var b : Bool? = true

if !b!{
    print(b!)
}

var arr : [Int] = [1,2,3]
if let first = arr.first{
    print(first)
}else{
    print("nil")
}

if let num1 = Int("45$"){
    print(num1)
}else{
    print("nil")
}
//------------------------------------------------------------

//tar
func sumOptionalIntArr(_ arr : [Int]?) -> Int?{
    if let arr = arr{
        var sum = 0
        for num in arr{
            sum += num
        }
        return sum
    }else{
        return nil
    }
}

sumOptionalIntArr(nil)

// second solution
func sumOptionalIntArr2(_ arr : [Int]?) -> Int?{
    guard let arr = arr else{
        return nil
    }
    var sum = 0
    for num in arr{
        sum += num
    }
    return sum
}

sumOptionalIntArr2(nil)
//-------------------------------------------------------

var myArr : [Int]?

myArr?.append(4)
if let first = myArr?.first{
    
}

let count = myArr?.count      // count is optional Int
let count1 = myArr?.count ?? 0    // in nil sp count = 0 so not optional

let myStr = "abc"
let myNum = Int(myStr) ?? 0

let myNum2 = Int(myStr) == nil ? 0 : Int(myStr)
//---------------------------------------------------------------

///// tar if optional String count 4 characters
// option1
func validateSmsCode1(_ str : String?) -> Bool{
    if str != nil{
        return str!.characters.count == 4
    } else{
        return false
    }
}

// option2
func validateSmsCode2(_ str : String?) -> Bool{
    if let str = str, str.characters.count == 4{
        return true
    }else{
        return false
    }
}

// option3
func validateSmsCode3(_ str : String?) -> Bool{
    guard let str = str else{
        return false
    }
    return str.characters.count == 4
}

// option4
func validateSmsCode4(_ str : String?) -> Bool{
    return (str ?? "").characters.count == 4
    return (str?.characters.count == 4) ?? false
    return str?.characters.count == 4
    return(str?.characters.count ?? 0) == 4
}
