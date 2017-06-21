//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let ch : Character = "a"
let ch1 : Character =  "\u{1f496}"
let ch2 : Character = "\u{1f4a9}"

let str1 = "hello 😍"
let str2 = "world"
let str3 = str1 + " " + str2
str3.characters.count
(str3 as NSString).length    //emoji is 2 place
str3.isEmpty

var arr = [1,2,3,0]
arr.sort {$0 < $1}