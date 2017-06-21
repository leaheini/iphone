//: Playground - noun: a place where people can play

import UIKit

var strmjmm : String = "Hello, playground"
let num1 : Int = 1     // terminant, cannot be changed
var num2 : Int = 2
var summ = num1 + num2

var num3 : Double = 3    // 3.0

num2 += 2
//num1 += 2       cannot cause let cant be changed

let num4 = Double(num2)
let sum2 : Double = num4 + num3
let sum3 : Double = Double(num2) + num3

var r : Int = Int(arc4random())
var r1 :Int64 = Int64(arc4random())

let num : UInt8 = 255

let n : Float = 3.5

let number1 : Int = 40
let number2 : Int = 3
number1 - number2
number1 * number2
let c = number1 / number2
let m = number1 % number2

print(m)
print("test")
print(number1 > number2)
print("\(number1) - \(number2) is \(number1 - number2)")

let radius = 5
let pi = M_PI
let p = 2 * pi * Double(radius)
let s = pi * pow(Double(radius), 2)

let str = String(format: "%.2f",  pi)

var n1 = 1
var n2 = 2
n1 | n2
n1 & n2

let arr = [1,2,3,4,3,2,1]
var sum = 0

for n in arr{
    sum ^= n
}

sum   // print



