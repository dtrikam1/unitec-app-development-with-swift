//
//  ViewController.swift
//  Strings + Functions + Structures
//
//  Created by Dipesh Trikam on 18/02/19.
//  Copyright © 2019 Dipesh Trikam. All rights reserved.
//

import UIKit

struct Temperature {

    static var boilingPoint = 100

    var celsius: Double = Double.init() //Initialzer

    init(celsius: Double) { // Custom initializers
        self.celsius = celsius //“The use of self is required within initializers that have parameter names that match property names.”
    }

    init(fahrenheit: Double) {
        celsius = (fahrenheit - 32) / 1.8
    }

    init(kelvin: Double) {
        celsius = kelvin - 273.15
    }

    mutating func reset() {
        celsius = 0;
    }
}

struct Size {
    var width: Double
    var height: Double = 0 {
        willSet {
            print("Current height is: \(height)")
        }
        didSet {
            let area = width * height
            print("The area of the shape is \(area) square metres")
        }
    }

    func perimeter() -> Double { // this is an instance method
        return 2 * (width * height)
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

//        strings(str: "Hello, playground")

//        multiplyFunction()

        structs()
    }

    func strings(str: String){

        var strArray = Array(str)

        // character
        str[str.startIndex] // H
        //str[str.endIndex]   // error: after last character
        print(str[str.startIndex])

        // before: refers to the index of the character directly before the given index.
        print(str[str.index(before: str.endIndex)])

        // range
        let range = str.startIndex..<str.endIndex
        str[range]  // "Hello, playground"

        let index = str.index(str.startIndex, offsetBy: 7)
        str[index]  // p

        // offsetBy
        let start = str.index(str.startIndex, offsetBy: 7)
        let end = str.index(str.endIndex, offsetBy: -6)
        let offsetRange = start..<end
        str[offsetRange]  // play

        // limitedBy
        if let index = str.index(str.startIndex, offsetBy: 7, limitedBy: str.endIndex) {
            str[index]  // p
        }

        /*
         Other advanced topics

         insert(_:, at:)
         insert(contentsOf:, at:)
         remove(at:)
         removeSubrange(_:)
         replaceSubrange(_:, with:)
         */
    }

    func multiply(firstNumber: Int, secondNumber: Int = 1) -> Int {
        return firstNumber * secondNumber
    }

    func structs(){
        var currentTemp = Temperature(celsius: 18.5)

        print(currentTemp.celsius)
        print(currentTemp.reset()) // Call mutating method
        print(currentTemp.celsius)

        let boilingWaterTemp = Temperature(fahrenheit: 212)
        let freezing = Temperature(kelvin: 273.15)

        print(boilingWaterTemp.celsius)

        print("The boiling point of water is \(Temperature.boilingPoint) degrees Celcius")

    /*Instance methods are functions that can be called on specific instances of a type. They provide ways to access and modify properties of the structure, and they add functionality that relates to the instance's purpose.*/

        var rectangle = Size(width: 20, height: 30)
        rectangle.height = 50 // You can see when we set the height that's when the property observer get's set
        print(rectangle.perimeter()) // This is an instance method.
    }

    func multiplyFunction(){

        var result = multiply(firstNumber: 10, secondNumber: 20)
        print(result)

        result = multiply(firstNumber: 10)
        print(result)

        var listOfNumbers = [Int]()
        var digitCounts = Array(repeating: 2, count: 10)

        for i in 0..<10 {
            listOfNumbers.append(i)
        }

        for i in 0..<listOfNumbers.count {
            print(multiply(firstNumber: listOfNumbers[i], secondNumber: digitCounts[i]))
        }
    }
}
