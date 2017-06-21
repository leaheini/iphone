//: Playground - noun: a place where people can play

import UIKit

func doNothing(){
    
}

doNothing()

func doSomething(){
    print("doing something")
}

doSomething()

//------------------------------------------------------

func rollDice() -> Int{
    //let num = arc4random_uniform(7)   // 0...6
    return Int(arc4random_uniform(6)) + 1   // 1...6
}

rollDice()

//------------------------------------------------------

func simonSaid(word : String){
    print("simon said: " + word)
}

simonSaid(word: "Mazal Tov")
//------------------------------------------------------


func simonSaid2(word w: String){
    print("simon1 said: " + w)
}

simonSaid2(word: "Tovvvv")
//------------------------------------------------------


func simonSaid3(_ w: String){
    print("simon2 said: " + w)
}


simonSaid3("mazal")
//------------------------------------------------------

let s1 = "heLLo"
s1.uppercased()
s1.lowercased()

func countVocals (_ str: String) -> Int{
    var counter = 0
    let arr : [Character] = [ "a", "e", "i", "o", "u"]
    for ch in str.lowercased().characters{
        if arr.contains(ch){
            counter += 1
        }
    }
    /*
    for ch in str.lowercased().characters{
        switch ch {
        case "a", "e", "i", "o", "u":
            counter += 1
        default:
            break
        }
    }
 */
    return counter
}

countVocals("leah")
//------------------------------------------------------

func fibo (_ i : Int) -> Int{
    switch i {
    case 0:
        return 0
    case 1:
        return 1
    default:
        return fibo(i - 2) + fibo(i - 1)
    }
}

fibo (4)

//------------------------------------------------------

// how many x inside num --> num / x
func countOccurences(num : Int, x : Int) -> Int{
    if num < x{
        return 0
    }
    return 1 + countOccurences(num: num - x, x: x)
}

countOccurences(num: 27, x: 13)
//------------------------------------------------------

func isPolindrom (_ arr :  [Int]) -> Bool{
    let count = arr.count
    if count == 0  || count == 1 {
        return true
    }
    
    var arr = arr
    let first = arr.removeFirst()
    let last = arr.removeLast()
    
    if (first != last){
        return false
    }
    return isPolindrom(arr)
}

isPolindrom([1,2,3,2,1])
//------------------------------------------------------

// switch numbers
func mySwap(_ n1 : inout Int, _ n2 : inout Int){
    n1 = n1 + n2
    n2 = n1 - n2
    n1 = n1 - n2
}

var n1 = 3
var n2 = 5
mySwap(&n1, &n2)
//------------------------------------------------------

var myArr = [9,0,19]

func mySortFunc(_ a : Int, _ b : Int) -> Bool{
    return a > b
}
let f = mySortFunc
myArr.sort(by: mySortFunc)

myArr.sort(by: <)
let otherArray = myArr.sorted(by: >)
//------------------------------------------------------

func timerFunc(_ t : Timer){
    print(#function)   // print the function u r in
}

Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: timerFunc)   // every 1 sec to do make the func
//------------------------------------------------------

// func will return the max value in the arr
func maxValueIn(array : [Int]) -> Int{
    if array.isEmpty{
        print("empty array")
        return -1
    }
    var m = array[0]
    for i in 1..<array.count{
        m = max(m, array[i])
    }
    return m
}

maxValueIn(array: [0,11,2])
