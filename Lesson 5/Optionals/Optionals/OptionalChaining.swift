//
//  OptionalChaining.swift
//  Optionals
//
//  Created by Dipesh Trikam on 12/08/19.
//  Copyright © 2019 Dipesh Trikam. All rights reserved.
//

import Foundation

class Person {
    var age: Int = 0
    var residence: Residence?
}

class Residence {
    var address: Address?
}

class Address {
    var buildingNumber: String = ""
    var streetName: String = ""
    var apartmentNumber: String?
}
