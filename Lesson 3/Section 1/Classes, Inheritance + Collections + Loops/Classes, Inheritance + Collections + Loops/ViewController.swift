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
        let jack = Student(name: "Jack", favoriteSubject: "Math", age: 24)
        print(jack.age)
    }
}

