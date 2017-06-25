//: Playground - noun: a place where people can play

import UIKit

 let arr : [Any] = [1,3.14, "hello"]
 let obj = arr[0]
 
 var num = 1
 
 let d = arr[1] as? Double   // optional Double
 var num1 : Double = 1.0
 if let d1 = arr[2] as? Double{
 num1 += d1
 } else {
 print("not double")
 }
 
 if obj is Int{
 print("first object is Int")
 num += obj as! Int
 }
 //------------------------------------------
 
 func sumNumber(_ arr : [Any] ) -> Double?{
 var sum : Double = 0
 for item in arr{
 if let num = item as? Int{
 sum += Double(num)   // create new Double from Any
 } else if  let num = item as? Double{
 sum += num
 } else if let str = item as? String,
 let num = Double(str){
 sum += num
 }
 }
 return sum
 }
 
 sumNumber([1,2,4.5,"hello","3.14", CGPoint.zero, "-10"])
 CGPoint.zero
 //-----------------------------------------------------------------------------
 // tar: func which get arr of any -> and return the max

/* // my answer
 func max(in arr: [Any]) -> Double?{
 var max : Double = 0
 for any in arr{
 if let num = any as? Int, Double(num) > max{
 max = Double(num)
 } else if let num = any as? Double, num > max{
 max = num
 } else if let str = any as? String, let num = Double(str), num > max{
 max = num
 }
 }
 return max
 }
 
 max(in: ["-50", -400, -1.5, 7,"minus 1_000_000", "-ff"])
 */

// Benny's answer
extension Double{
    init?(_ val : Any){
        if let dVal = val as? Double{
            self = dVal
        } else if let n = val as? Int{
            self = Double(n)
        }   else if let str = val as? String,  let dVal = Double(str){
            self = dVal
        } else {
            return nil
        }
    }
}


func maxInArr(_ arr : [Any]) -> Double?{
    var maxVal : Double? = nil
    
    for item in arr{
        guard let dVal = Double(item) else{
            continue  //next item
        }
        
        if maxVal == nil || maxVal! < dVal{
            maxVal = dVal
        }
    }
    return maxVal
}

maxInArr([ NSNull(),"a","3",4.5,2,-7])
maxInArr([])