//
//  ViewController.swift
//  Corgi
//
//  Created by Hayden Do on 24/02/19.
//  Copyright © 2019 Datacom. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var mainImageView: UIImageView!
    
    let imageArray = ["corgi1", "corgi2", "corgi3", "corgi4", "corgi5", "corgi6", "corgi7", "corgi8", "corgi9",]
    var imageArrayIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainImageView.image = UIImage(named: imageArray[0])
        imageArrayIndex = 1
    }

    @IBAction func nextButtonPress(_ sender: UIButton) {
        mainImageView.image = UIImage(named: imageArray[imageArrayIndex])
        imageArrayIndex += 1
        
        if imageArrayIndex >= imageArray.count {
            imageArrayIndex = 0
        }
    }
}

