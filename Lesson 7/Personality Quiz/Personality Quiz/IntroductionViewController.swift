//
//  IntroductionViewController.swift
//  Personality Quiz
//
//  Created by Dipesh Trikam on 2/09/19.
//  Copyright © 2019 Dipesh Trikam. All rights reserved.
//

import UIKit

class IntroductionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let url = URL(string: "https://jsonplaceholder.typicode.com/todos/1")!
        let task = URLSession.shared.dataTask(with: url) { (data,
            response, error) in
            if let data = data,
            let string = String(data: data, encoding: .utf8) {
            print(string)
            }
        }
        
        task.resume()

    }

}
