//
//  WeatherOverview.swift
//  Weather Auto Layout
//
//  Created by Hayden Do on 23/08/19.
//  Copyright © 2019 Unitec. All rights reserved.
//

import UIKit

class WeatherOverviewViewController: UIViewController {
    
    var selectedRow: Int?
    let weatherList: [Weather] = [
        Weather(location: "Auckland", subtitle: "Mostly Sunny", avgTemp: 16, highTemp: 16, lowTemp: 11),
        Weather(location: "San Francisco", subtitle: "Sunny", avgTemp: 22, highTemp: 24, lowTemp: 15)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func showDetails(_ sender: UIButton) {
        selectedRow = sender.tag
        performSegue(withIdentifier: "ShowWeatherDetails", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? WeatherDetailsViewController, let _selectedRow = selectedRow {
            if _selectedRow < weatherList.count {
                destination.weather = weatherList[_selectedRow]
            }
        }
    }
    
}
