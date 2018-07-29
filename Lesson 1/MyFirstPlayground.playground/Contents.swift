//: Playground - noun: a place where people can play

import UIKit // Allows you to use anything from the UIKit
import Foundation

//------------------------------------------------------------------------------------

// Taught in Unit 2 (Lesson 2.2)

/*Excerpt From: Apple Education. “App Development with Swift.” Apple Inc. - Education, 2017. iBooks. https://itunes.apple.com/nz/book/app-development-with-swift/id1219117996?mt=11 */

func pickGamerTag() -> String {
    // An array of 'String' elements
    let gamerTags = ["MrLions", "IMadeYouReadThis", "Omni-Slash"]

    // Picks a random number between 0 and 2
    let randomInt = Int(arc4random_uniform(3))

    // Returns a random street name
    return gamerTags[randomInt]
}

//------------------------------------------------------------------------------------

// Most common types in Swift
// 1. Int - Represents whole numbers, or integers
// 2. Double - Represents numbers requiring decimal points
// 3. Boolean - Represents true or false / yes or no values
// 4. String - Represents text

let playersScore: Int = 1000 //Notice how there is no ambiguity with the variable names that i have created
let pi: Double = 3.1415927
let gameOver = false

var gamerTag: String = "strider_91"
var str = "strider_91"

// What if 'gamerTag' was a 'let' constant?

// Both of these do the same thing! Why would I ever need to use type annotations?
// There might be times where need to assign your variable later in your application

gamerTag = pickGamerTag()

print(gamerTag)


