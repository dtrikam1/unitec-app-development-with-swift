//
//  ViewController.swift
//  Working with the web
//
//  Created by Dipesh Kumar Trikam on 8/09/19.
//  Copyright © 2019 Dipesh Kumar Trikam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchPhotoInfo { (fetchedInfo) in
            if let infoFetched = fetchedInfo {
                print(infoFetched)
            }
        }
    }
    
    func fetchPhotoInfo(completion: @escaping (PhotoInfo?) -> Void) {
        let baseURL = URL(string: "https://api.nasa.gov/planetary/apod")!
        
        let query: [String: String] = [
            "api_key": "DEMO_KEY",
        ]
        
        let url = baseURL.withQueries(query)!
        let task = URLSession.shared.dataTask(with: url) { (data,
            response, error) in
            let jsonDecoder = JSONDecoder()
            if let data = data,
                let photoInfo = try? jsonDecoder.decode(PhotoInfo.self, from: data) {
                completion(photoInfo)
            } else {
                print("Either no data was returned, or data was not properly decoded.")
                completion(nil)
            }
        }
        
        task.resume()
    }
    
    
}

