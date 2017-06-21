//: Playground - noun: a place where people can play

import UIKit

// all three are the same
var arr1 : Array<Int> = [1,2,3]
let arr2 : [Int] = [1,2,3]
let arr3 = [1,2,3]
let arr4 : [Any] = [1,2,"str",3.4]

arr1 += arr2
arr1 += [4,5,6]


if arr4[1] is Int{
    print(true)
}

arr1[2]
arr1[0] = 9
arr1
arr1.count
arr1.append(20)
arr1.insert(7, at: 2)
arr1.remove(at: 2)
arr1

arr1[0...2] = [0]
arr1
arr1[0...0] = [1,1,1,1]
arr1

for numm in arr1{
    
}

for i in 0..<arr1.count{
    let numm = arr1[i]
}

arr1
for i in stride(from: 0, to: arr1.count, by: 3){
    print(i)
}

for (index, val) in arr1.enumerated(){
    index
}

//// targil:  7 boom  ////
extension Int{
    func contains(_ d: Int) -> Bool{
        var num = self
        while num > 0{
            if num % 10 == d{
                return true
            }
            num = num / 10
        }
        return false
    }
}
14.contains(4)

func checkBoom(_ num : Int, digit d: Int) -> Bool{
    var num = num
    while num > 0{
        if num % 10 == d{
            return true
        }
        num = num / 10
    }
    return false
}
//checkBoom(700, digit: 7)


let arr5 = [Int](repeatElement(0,count: 30))

var count = 0
for var n in 1...999{
    if (n % 7 == 0) {
        count += 1
        continue
    }
    
    if n.contains(7){
        count += 1
        continue
    }

/*
    if checkBoom(n, digit: 7){
        count += 1
        continue
    }
 */
    
    /*
    if (n % 10 == 7){     // ahadot
        count += 1
        continue
    }
    if (n/10) % 10 == 7{   // asarot
        count += 1
        continue
    }*/
}
print(count)

///// targil: how many numbers from 5 to 11 / 2 without loop   ////
let a = 5
let b = 11
let c = 2
let r = b/c - a/c + ((a % c == 0) ? 1 : 0)



