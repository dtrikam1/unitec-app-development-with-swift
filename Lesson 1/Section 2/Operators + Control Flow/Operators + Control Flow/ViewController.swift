//
//  ViewController.swift
//  Operators + Control Flow
//
//  Created by Dipesh Trikam on 18/02/19.
//  Copyright © 2019 Dipesh Trikam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        operatorsDemonstration()

        controlFlow()
    }

    func operatorsDemonstration(){
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
    }

    func controlFlow() {
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
    }

}

