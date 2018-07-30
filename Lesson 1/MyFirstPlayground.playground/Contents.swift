//: Playground - noun: a place where people can play

import UIKit // Allows you to use anything from the UIKit
import Foundation

// Most common types in Swift
// 1. Int - Represents whole numbers, or integers
// 2. Double - Represents numbers requiring decimal points
// 3. Boolean - Represents true or false / yes or no values
// 4. String - Represents text

let playersScore: Int = 1000 //Notice how there is no ambiguity with the variable names that i have created
let pi: Double = 3.1415927
let gameOver: Bool = false

var gamerTag: String = "strider_91"
var str = "strider_91"

// What if 'gamerTag' was a 'let' constant?

// Both of these do the same thing! Why would I ever need to use type annotations?
// There might be times where need to assign your variable later in your application

gamerTag = "IMadeYouReadThis"

print(gamerTag)


