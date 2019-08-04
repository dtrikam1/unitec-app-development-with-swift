//
//  ViewController.swift
//  Classes, Inheritance + Collections + Loops
//
//  Created by Dipesh Trikam on 19/02/19.
//  Copyright © 2019 Dipesh Trikam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    class Person {
        let name: String
        var age: Int

        init(name: String, age: Int) {
            self.name = name
            self.age = age
        }
    }

    class Student: Person {
        var favouriteSubject: String = ""

        init(name: String, favoriteSubject: String, age: Int) {
            self.favouriteSubject = favoriteSubject
            super.init(name: name, age: age)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        createStudent()

        createVehicle()

        createBicycle()

        createTandem()

        createTrain()
    }

    func createStudent(){
        let jack = Student(name: "Jack", favoriteSubject: "Math", age: 24)
        print(jack.age)
        jack.age += 1
        print(jack.age)
    }

    func createVehicle(){
        let someVehicle = Vehicle()
        print("Vehicle: \(someVehicle.description)")
        someVehicle.makeNoise()
    }

    func createBicycle() {

        let bicycle = Bicycle()

        if bicycle.hasBasket {
            bicycle.currentSpeed = 15.0
        }
        else {
            bicycle.currentSpeed = 25.0
        }

        print("Bicycle speed: \(bicycle.description)") //What will be the value here?
    }

    func createTandem(){
        let tandem = Tandem()
        tandem.hasBasket = true
        tandem.currentNumberOfPassengers = 2
        tandem.currentSpeed = 22.0
        print("Tandem: \(tandem.description)")
    }

    func createTrain(){
        let train = Train()
        train.makeNoise()
    }
}

