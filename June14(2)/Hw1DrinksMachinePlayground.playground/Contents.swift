//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

func vendingMachine (amount: Double, cost: Double) -> [Int]{
    let amountInt = Int(amount * 100)
    let costInt = Int(cost * 100)
    var change = amountInt - costInt
    //let num = 10_000_000
    
    let coinsArray = [100,50,25,10,5,1]
    var changeArray = [Int](repeatElement(0, count: coinsArray.count))
    
    for i in 0..<coinsArray.count{
        let c = change / coinsArray[i]
        changeArray[i] = c
        change = change % coinsArray[i]
    }
    return changeArray
}

vendingMachine(amount: 1.99, cost: 1)
