//
//  ViewController.swift
//  Guard Statements
//
//  Created by Dipesh Trikam on 12/08/19.
//  Copyright © 2019 Dipesh Trikam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        guard true else {
            print("Condition not met")
        }
        print("Condition met")

//        In the above program, the guard condition evaluates to false. So, the statement print("Condition not met") inside else should execute. But you will get an error saying 'guard' body may not fall through, consider using a 'return' or 'throw' to exit the scope.
//
//        The error message in simple word means, you need to transfer program control from the guard statement using return, break, continue or throw statements. For now we are going to use return. And since return statement can be used only inside a function, we are going to wrap above code in Swift Functions.
//        guard false else {
//            print("Condition not met")
//            return
//        }
//        print("Condition met")


        someFunction()
        print("Hello after function call")

        changeOptionalStringToUpperCase()

    }

    func someFunction() {
        guard false else {
            print("Condition not met")
            return
        }
        print("Condition met")
    }

//    func changeOptionalStringToUpperCase() {
//        var name:String?
//        guard let temp = name else {
//            print("Name is nil. Cannot process")
//            return
//        }
//        print("Uppercased:\(temp.uppercased())")
//    }

//    func changeOptionalStringToUpperCase() {
//
//        var name:String?
//        if let temp = name {
//            print("Uppercased:\(temp.uppercased())")
//        } else {
//            print("Name is nil. Cannot process")
//            return
//        }
//        //how to access temp here?? Solution:Use Guard
//    }

    func changeOptionalStringToUpperCase() {
        var name:String? = ""
        guard let temp = name , temp.count > 0  else {
            print("Name is nil or an empty string. Cannot process")
            return
        }
        print("Uppercased:\(temp.uppercased())")
    }

}

// https://www.programiz.com/swift-programming/guard-statement
