//: Playground - noun: a place where people can play

import UIKit // Allows you to use anything from the UIKit
import Foundation


// Most common types in Swift
// 1. Int - Represents whole numbers, or integers
// 2. Double - Represents numbers requiring decimal points
// 3. Boolean - Represents true or false / yes or no values
// 4. String - Represents text

// Constants - Not Mutable, unchanging
let playersScore: Int = 1000 //Notice how there is no ambiguity with the variable names created
let pi: Double = 3.1415927
let gameOver: Bool = false

var gamerTag: String = "strider_91"
var str = "strider_91"

// What if 'gamerTag' was a 'let' constant?

// Both of these do the same thing! Why would I ever need to use type annotations?
// There might be times where need to assign your variable later in your application

gamerTag = "IMadeYouReadThis"

print(gamerTag)


let constantString = "Hello" //can use this anywhere in the scope of our program

//constantString = "Changing"

let constantFloat = 2
//let constantFloat = 2.0
//let constantFloat = Float(2)

// Typed Constant
//let constantFloat : Float = 2 //type importing in swift
type(of: constantFloat)

// Variables allow us to change strings.

/* Variables - The following variables are mutated and changed at will, they may not be the same ass they were defined */

// Many languages use semi-colons at the end of line, you may have noticed. Swift has the option to do that, but generally speaking it's not a common thing to do unless you are trying to write code in the least amount of space possible

var changingString = "World"
print("\(constantString) \(changingString)")

changingString = constantString + changingString

print(changingString) // Why is there no space in this one?




