//
//  ViewController.swift
//  Temperature
//
//  Created by Hayden Do on 29/08/18.
//  Copyright © 2018 Hayden. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var temperatureTextField: UITextField!
    @IBOutlet weak var celsiusLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func convertToCelsius(_ sender: UIButton) {
        let fahrenheit = Double(temperatureTextField.text ?? "")
        if let fahrenheit = fahrenheit {
            let celsius = (fahrenheit - 32) / 1.8
            print("In celsius: ", celsius)
            print("In fahrenheit: ",fahrenheit)
            celsiusLabel.text = "Celsius: \(celsius)"
        }
        
    }
    
}

