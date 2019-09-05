//
//  WeatherOverviewViewController.swift
//  Weather Auto Layout
//
//  Created by Hayden Do on 27/08/19.
//  Copyright © 2019 Unitec. All rights reserved.
//

import UIKit

class WeatherOverviewViewController: UIViewController {
    
    var selectedRow: Int?
    let weatherList: [Weather] = [
        Weather(location: "Auckland", subtitle: "Mostly Sunny", avgTemp: 16, highTemp: 16, lowTemp: 11),
        Weather(location: "San Francisco", subtitle: "Sunny", avgTemp: 25, highTemp: 28, lowTemp: 22),
        Weather(location: "Gisborne", subtitle: "Raining", avgTemp: 14, highTemp: 18, lowTemp: 12)
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func showDetails(_ sender: UIButton) {
        selectedRow = sender.tag
        performSegue(withIdentifier: "showDetails", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? WeatherDetailsViewController, let selectedRow = selectedRow {
            if selectedRow < weatherList.count {
                destination.weather = weatherList[selectedRow]
            }
        }
    }
}

struct Weather {
    let location: String
    let subtitle: String
    let avgTemp: Float
    let highTemp: Float
    let lowTemp: Float
    
}
