//
//  ViewController.swift
//  Cocoapods
//
//  Created by Hayden Do on 14/10/19.
//  Copyright © 2019 Unitec. All rights reserved.
//

import UIKit
import Alamofire
import KeychainAccess
import Lottie

class ViewController: UIViewController {

    @IBOutlet weak var animationViewWrapper: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        alamofireExample()
        keychainExample()
        lottieExample()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private func alamofireExample() {
        // GET Request
        AF.request("https://cocoapodsproject.free.beeceptor.com/show").response { response in
            if let data = response.data {
                print(String(data: data, encoding: .utf8) ?? "")
            }
        }
        
        // POST Request
        AF.request("https://cocoapodsproject.free.beeceptor.com/add", method: .post, parameters: ["":""], encoder: JSONParameterEncoder.default).response { response in
            if let data = response.data {
                print(String(data: data, encoding: .utf8) ?? "")
            }
        }
    }
    
    private func keychainExample() {
        let keychain = Keychain(service: "nz.ac.unitec.Cocoapods")
        let accessTokenKey = "access-token"
        
        // Save data
        do {
            try keychain.set("fds676sf8b7b6b86sgds", key: accessTokenKey)
        } catch {
            print(error.localizedDescription)
        }
        
        // Retrieve data
        if let tokenOptional = try? keychain.getString(accessTokenKey), let token = tokenOptional {
            print("Token is \(token)")
        }
        
        // Remove data
        do {
            try keychain.remove(accessTokenKey)
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    private func lottieExample() {
        let animationView = AnimationView()
        let animation = Animation.named("cup-animation")
        animationView.animation = animation
        animationView.contentMode = .scaleAspectFit
        animationView.play()
        animationView.loopMode = .loop
        animationView.translatesAutoresizingMaskIntoConstraints = false
        
        self.animationViewWrapper.addSubview(animationView)
        let width = NSLayoutConstraint(item: animationView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 120)
        let height = NSLayoutConstraint(item: animationView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 120)
        self.animationViewWrapper.addConstraints([width, height])
    }
}

