//
//  ViewController.swift
//  Password
//
//  Created by Hayden Do on 29/08/18.
//  Copyright © 2018 Hayden. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func checkPassword(_ sender: UIButton) {
        let password = "password123"
        let userEnteredPassword = passwordTextField.text
        
        if password == userEnteredPassword {
            print("Successful login")
            resultLabel.text = "Successful login"
        } else {
            print("Incorrect password")
            resultLabel.text = "Incorrect password"
        }
    }
    
}

