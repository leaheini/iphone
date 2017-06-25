//: Playground - noun: a place where people can play

import UIKit

func flatArray(_ arr : [Any]) -> [Any]{
    var result : [Any] = []
    for item in arr{
        if let a = item as? [Any] {
            /*
            let t1 = flatArray(a)
            print(t1)
            result += t1
            print(result)
            */
            result += flatArray(a)
        }else{
            result.append(item)
        }
    }
    return result
}

flatArray([[1,2,3,[4,5], [[6],7],"[abc]"]])