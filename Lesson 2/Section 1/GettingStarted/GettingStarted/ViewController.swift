//
//  ViewController.swift
//  GettingStarted
//
//  Created by Dipesh Trikam on 30/07/18.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {

//        What would happen if we removed the brackets? Error or Bug?
        super.viewDidLoad()

//        Warning, declared but never used

//        let x = 4

        /* Use ? if the value can become nil in the future, so that you test for this.
         Use ! if it really shouldn't become nil in the future, but it needs to be nil initially.
         Both will compile in this situation, but it's better to use ? where you can so your app doesn't crash if navigationController does ever become nil in the future.*/

//        navigationController.title = "Debugging"
//        navigationController!.title = "Debugging"
//        navigationController?.title = "Debugging"


        /*The code below compiles fine, but if we were to run the application it would crash because removeFirst will remove the first element in the array and when the third call is made there will be nothing left to remove */

//        This method is used to display how you can use the step into functionality.
//        displayText()

//        var names = ["Tammy", "Cole"]
//        names.removeFirst()
//        names.removeFirst()
//        names.removeFirst()

    }

    func displayText() {
        print("This has been reached")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

