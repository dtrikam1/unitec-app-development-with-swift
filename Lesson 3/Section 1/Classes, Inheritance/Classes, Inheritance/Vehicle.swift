//
//  Vehicle.swift
//  Classes, Inheritance + Collections + Loops
//
//  Created by Dipesh Trikam on 4/08/19.
//  Copyright © 2019 Dipesh Trikam. All rights reserved.
//

import Foundation

class Vehicle {
    var currentSpeed = 0.0

    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }

    func makeNoise() {
        // do nothing - an arbitrary vehicle doesn't necessarily
        // make a noise
        print("Ring ring")
    }
}
