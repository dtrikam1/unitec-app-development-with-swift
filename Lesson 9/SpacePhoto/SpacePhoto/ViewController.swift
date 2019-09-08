//
//  ViewController.swift
//  SpacePhoto
//
//  Created by Dipesh Kumar Trikam on 8/09/19.
//  Copyright © 2019 Dipesh Kumar Trikam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var copyrightLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        descriptionLabel.text = ""
        copyrightLabel.text = ""
        
        let photoInfoController = PhotoInfoController()
        
        photoInfoController.fetchPhotoInfo { (fetchedInfo) in
            if let photoInfo = fetchedInfo {
                self.updateUI(with: photoInfo)
            }
        }
    }
    
    func updateUI(with photoInfo: PhotoInfo) {
        guard let url = photoInfo.url.withHTTPS() else { return }
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if let data = data,
                let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.title = photoInfo.title
                    self.imageView.image = image
                    self.descriptionLabel.text = photoInfo.description
                    
                    if let copyright = photoInfo.copyright {
                        self.copyrightLabel.text = "Copyright \(copyright)"
                    } else {
                        self.copyrightLabel.isHidden = true
                    }
                }
            }
        })
        task.resume()
    }
}

