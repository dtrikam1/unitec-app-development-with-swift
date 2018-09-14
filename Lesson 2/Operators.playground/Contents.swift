//: Playground - noun: a place where people can play

import UIKit

// 1.1 Addition
let addition = 10 + 10
print("Addition", addition)

// 1.2 Subtraction
let subtraction = 100 - 20
print("Subtraction", subtraction)

// 1.3 Multiplication
let multiplication = 5 * 2
print("Multiplication", multiplication)

// 1.4 Division
let division = 20 / 2
print("Division", division)

// 1.5 Operators using variables
let watermelon = 20
let oranges = 4
let durian = 8

let totalCost = watermelon * 8 + oranges * 5 + durian * 0
print("Total Cost", totalCost)


// 1.6 BEDMAS
// Brackets, Exponents, Division/Multiplication, Addition/Subtraction
let result1 = 10 + 3 * 2
print("BEDMAS Result 1", result1)

let result2 = (10 + 3) * 2
print("BEDMAS Result 2", result2)


// 1.7 Compound Assignment
var count = 0
count += 10   // This is the same as doing count = count + 10
count -= 5    // This is the same as doing count = count - 5
count *= 2    // This is the same as doing count = count * 2
count /= 5    // This is the same as doing count = count / 5
print("Count", count)

// 1.8 Type conversions

let x = 2
let y = 2.5
let z = Double(x) * y    //If we dont 'cast' the int into a double, it wont compile!
print(z)

// 1.9 Mini project - Temperature
let fahrenheit: Double = 60
let celsius = (fahrenheit - 32) / 1.8
print("In celsius: ", celsius)
print("In fahrenheit: ",fahrenheit)







