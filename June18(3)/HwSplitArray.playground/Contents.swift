//: Playground - noun: a place where people can play

import UIKit

func splitArray(_ arr : [Int]) -> (negatives : [Int], rest : [Int]){
    var negativesArr : [Int] = []
    var restArr : [Int] = []
    //var t : (negatives : [Int], rest : [Int]) = ([],[])
    //t.negatives.append(<#T##newElement: Element##Element#>)
    
    for num in arr{
        if num < 0{
            negativesArr.append(num)
        }else{
            restArr.append(num)
        }
    }
    
    return(negativesArr.sorted(), restArr.sorted())
}

let t = splitArray([-2,4,-8,1])
t.negatives
t.rest
t.0
t.1