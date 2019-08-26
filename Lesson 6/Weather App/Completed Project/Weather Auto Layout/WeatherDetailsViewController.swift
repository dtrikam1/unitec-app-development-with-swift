//
//  ViewController.swift
//  Weather Auto Layout
//
//  Created by Hayden Do on 7/08/19.
//  Copyright © 2019 Unitec. All rights reserved.
//

import UIKit

class WeatherDetailsViewController: UIViewController {
    
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var subtitle: UILabel!
    @IBOutlet weak var avgTemp: UILabel!
    @IBOutlet weak var highTemp: UILabel!
    @IBOutlet weak var lowTemp: UILabel!
    
    
    var weather: Weather?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        location.text = weather?.location
        subtitle.text = weather?.subtitle
        if let _avgTemp = weather?.avgTemp {
            avgTemp.text = "\(_avgTemp)°"
        }
        
        if let _highTemp = weather?.highTemp {
            highTemp.text = "\(_highTemp)°"
        }
        
        if let _lowTemp = weather?.lowTemp {
            lowTemp.text = "\(_lowTemp)°"
        }
    }


}

