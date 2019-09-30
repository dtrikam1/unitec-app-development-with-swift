//
//  ViewController.swift
//  Practical Animations
//
//  Created by Dipesh Kumar Trikam on 29/09/19.
//  Copyright © 2019 Dipesh Kumar Trikam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var albumImageView: UIImageView!
    @IBOutlet weak var reverseButton: UIButton!
    @IBOutlet weak var playPauseButton: UIButton!
    @IBOutlet weak var forwardButton: UIButton!
    
    var isPlaying: Bool = true {
        didSet {
            if isPlaying {
                playPauseButton.setImage(UIImage(named:
                    "pause")!, for: .normal)
            } else {
                playPauseButton.setImage(UIImage(named:
                    "play")!, for: .normal)
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        reverseButton.layer.cornerRadius = 30
        reverseButton.clipsToBounds = true
        reverseButton.backgroundColor = UIColor.lightGray.withAlphaComponent(0);
        
        playPauseButton.layer.cornerRadius = 20
        playPauseButton.clipsToBounds = true
        playPauseButton.backgroundColor = UIColor.lightGray.withAlphaComponent(0);
        
        forwardButton.layer.cornerRadius = 30
        forwardButton.clipsToBounds = true
        forwardButton.backgroundColor = UIColor.lightGray.withAlphaComponent(0);
    }
    
    @IBAction func playPauseButtonTapped() {
        if isPlaying {
            UIView.animate(withDuration: 0.5) {
                self.albumImageView.transform =
                    CGAffineTransform(scaleX: 0.8, y: 0.8)
            }
        } else {
            UIView.animate(withDuration: 0.5, animations: {
                self.albumImageView.transform =
                    CGAffineTransform.identity
            })
        }
        
        isPlaying = !isPlaying
    }
    
    @IBAction func touchedDown(_ sender: UIButton) {
        let button: UIButton
        
        switch sender {
        case reverseButton:
            button = reverseButton
        case playPauseButton:
            button = playPauseButton
        case forwardButton:
            button = forwardButton
        default:
            return
        }
        
        UIView.animate(withDuration: 0.25) {
            button.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3);
            sender.transform = CGAffineTransform(scaleX: 0.8, y:
                0.8)
        }
    }
    
    @IBAction func touchedUpInside(_ sender: UIButton) {
        let button: UIButton
        
        switch sender {
        case reverseButton:
            button = reverseButton
        case playPauseButton:
            button = playPauseButton
        case forwardButton:
            button = forwardButton
        default:
            return
        }
        
        UIView.animate(withDuration: 0.25, animations: {
            button.backgroundColor = UIColor.lightGray.withAlphaComponent(0);
            button.transform = CGAffineTransform(scaleX:
                1.2, y: 1.2)
            sender.transform = CGAffineTransform.identity
        }) { (_) in
            button.transform = CGAffineTransform.identity
        }
    }
}

