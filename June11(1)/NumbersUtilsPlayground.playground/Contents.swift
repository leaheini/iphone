//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let num1 : Double = 3
let num2 : Double = 4
let num3 : Double = 5

if (num1 > 0 || num2 == 30 ) && arc4random() % 2 == 0{
    print("positive")
} else {
    print ("non positive")
}

arc4random_uniform(100) + 100

if pow(num1, 2) + pow(num2, 2) == pow(num3, 2){
    print("pitagoras")
}

let b1 : Bool = true
let b2 = false

b1 || !b1    // always true
b2 && !b2   // always false