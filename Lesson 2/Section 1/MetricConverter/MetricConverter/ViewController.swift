//
//  ViewController.swift
//  MetricConverter
//
//  Created by Dipesh Trikam on 3/09/18.
//  Copyright © 2018 Dipesh Trikam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var kilometersTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func ConvertButton(_ sender: Any) {

        if let userEnteredKilometres = Double(kilometersTextField.text!) {
            resultLabel.text = String(userEnteredKilometres * 0.6214)
        }

    }

}

