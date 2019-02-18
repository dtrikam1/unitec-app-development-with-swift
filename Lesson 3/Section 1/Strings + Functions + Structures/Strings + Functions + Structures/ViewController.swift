//
//  ViewController.swift
//  Strings + Functions + Structures
//
//  Created by Dipesh Trikam on 18/02/19.
//  Copyright © 2019 Dipesh Trikam. All rights reserved.
//

import UIKit

struct Temperature {
    var celsius: Double = Double.init(); //Initialzer

    init(celsius: Double) { // Custom initializers
        self.celsius = celsius
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
    var height: Double

    func perimeter() -> Double {
        return 2 * (width * height)
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        //        strings(str: "Hello, playground")
        //
        //        var result = multiply(firstNumber: 10, secondNumber: 20)
        //        print(result)
        //
        //        result = multiply(firstNumber: 10)
        //        print(result)

        structs()
    }

    func strings(str: String){

        var strArray = Array(str)

        // character
        str[str.startIndex] // H
        //str[str.endIndex]   // error: after last character

        // before: refers to the index of the character directly before the given index.
        str[str.index(before: str.endIndex)]

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
        print(currentTemp.reset())
        print(currentTemp.celsius)

        let boilingWaterTemp = Temperature(fahrenheit: 212)
        let freezing = Temperature(kelvin: 273.15)

        print(boilingWaterTemp.celsius)

    /*Instance methods are functions that can be called on specific instances of a type. They provide ways to access and modify properties of the structure, and they add functionality that relates to the instance's purpose.*/

        let rectangle = Size(width: 20, height: 30)
        print(rectangle.perimeter())
    }
}
