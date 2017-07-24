//: Playground - noun: a place where people can play

import UIKit

let str :String = "Hello, playground"

//3+2
"こんにちは"

var inttest :UInt = UInt.max

print("test")

var value :String?
value = "こんにちは"
if let value = value {
    print(value)
}


var radio = UISwitch()
radio.isOn = true
radio.setOn(false, animated: true)

radio.setOn(true, animated: true)
func reqMinAndMax() -> (min :Int, max :Int){
    //値はタプルで返却する
    return (1, 100)
}

let minAndMax = reqMinAndMax()
let minVal = minAndMax.min


