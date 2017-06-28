//: Playground - noun: a place where people can play

import UIKit

protocol pizzaDelegate{
    func pizza(_ pizza : Pizza,  slicesLeft : Int)
}

class Pizza{
    var slices = 8
    var delegate : pizzaDelegate?  // can be nil
    
    func eatSlice(){
        guard slices > 0 else {
            return
        }
        slices -= 1
        
        delegate?.pizza(self, slicesLeft: slices)   // tell the protocol how many slices left
    }
}

let p1 = Pizza()
p1.delegate
p1.eatSlice()
p1.slices

class Worker : /*NSObject,*/ pizzaDelegate{   // first inheritance, then protocol
    
    func pizza(_ pizza: Pizza, slicesLeft: Int){
        print(#function)
        if slicesLeft == 2{
            makeNewPizza()
        }
    }
    
        func makeNewPizza(){
            print(#function)
        }
}

let w1 = Worker()
p1.delegate = w1
for _ in 0..<p1.slices{
    p1.eatSlice()
}

