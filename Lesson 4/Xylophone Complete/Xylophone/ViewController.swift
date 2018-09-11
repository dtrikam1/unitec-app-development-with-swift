//
//  ViewController.swift
//  Xylophone
//
//  Created by Hayden Do on 24/08/18.
//  Copyright © 2018 Hayden. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var audioPlayer : AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        // Set sound name based on tag
        var soundName = ""
        switch sender.tag {
        case 0:
            soundName = "0"
        case 1:
            soundName = "1"
        case 2:
            soundName = "2"
        case 3:
            soundName = "3"
        case 4:
            soundName = "4"
        case 5:
            soundName = "5"
        case 6:
            soundName = "6"
        default:
            soundName = ""
        }
        
        // Gets the sound resource
        if let soundResource = Bundle.main.url(forResource: soundName, withExtension: "wav") {
            do {
                // Think of this as putting CD in a CD player
                audioPlayer = try AVAudioPlayer(contentsOf: soundResource)
                
                // Plays the sound file
                audioPlayer?.play()
            } catch  {
                // Catches any errors that might occur while putting the CD in the CD player
                print(error)
            }
        }
    }

}

