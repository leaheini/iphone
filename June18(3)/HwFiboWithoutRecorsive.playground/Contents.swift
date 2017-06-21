//: Playground - noun: a place where people can play

import UIKit

func fibo(_ i : Int) -> UInt64{
    var n1 : UInt64 = 0
    var n2 : UInt64 = 1
    if i == 0{
        return n1
    }
    if i == 1{
        return n2
    }
    
    for _ in 2...i{
        let sum = n1 + n2
        n1 = n2
        n2 = sum
    }

    return n2
}

fibo(90)
