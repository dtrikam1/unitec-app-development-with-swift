//: Playground - noun: a place where people can play

import UIKit

// Logical operator - ==
// Since the two strings are the same, it will be true
let equalOperator1 = "Echoooo" == "Echoooo"
print("Equal Operator 1", equalOperator1)

// There are two different int, so it will be false
let equalOperator2 = 1080 == 720
print("Equal Operator 2", equalOperator2)

// Logical operator - !=
// Think of this as the reverse of the ==. If the == is true, then =! will be false
let notEqualOperator1 = "Echoooo" != "Echoooo"
print("Not Equal Operator 1", notEqualOperator1)

let notEqualOperator2 = 1080 != 720
print("Not Equal Operator 2", notEqualOperator2)

// Logical operator >, >=, <, <=
// 10 is greater than 5, so it will be true
let operator1 = 10 > 5
print("Operator 1", operator1)

// Logical operator - AND (&&)
// Both must be true to be true
let and = true && true
print("AND", and)

// Logical operator - OR (||)
// Just one needs to be true to be true
let or = true || false
print("OR", or)

// Logical operator - NOT (!)
// Adding ! infront of a boolean will reverse it
let not = !true
print("NOT", not)



// If statements
let isHotdog = true

if isHotdog {
    //If it is true
    print("It is a hotdog")
} else {
    //If it is false
    print("It is not a hotdog")
}

// Multiple if statements
let numberOfWheels = 2
if numberOfWheels == 1 {
    print("Unicycle")
} else if numberOfWheels == 2 {
    print("Bicycle")
} else if numberOfWheels == 3 {
    print("Tricycle")
} else if numberOfWheels == 4 {
    print("Quadcycle")
} else {
    print("Too many wheels!")
}

//Switch statements
switch numberOfWheels {
case 1:
    print("Unicycle")
case 2:
    print("Bicycle")
case 3:
    print("Tricycle")
case 4:
    print("Quadcycle")
default:
    print("Too many wheels!")
}

// Mini project - Log in
// First password the actual password and the other is the one the user just entered
let password = "password123"
let userEnteredPassword = "password123"

if password == userEnteredPassword {
    print("Successful login")
} else {
    print("Incorrect password")
}


