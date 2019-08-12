//
//  ViewController.swift
//  Optionals
//
//  Created by Dipesh Trikam on 12/08/19.
//  Copyright © 2019 Dipesh Trikam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    struct Book {
        var name: String
//        var publicationYear: Int
        var publicationYear: Int? //Optional
        var authorsFirstName: String
        var authorsMiddleName: String?
        var authorsLastName: String //How would you improce this? could you use a class?
    }

    struct Toddler {
        var name: String
        var monthsOld: Int

        init?(name: String, monthsOld: Int) {
            if monthsOld < 12 || monthsOld > 36 {
                return nil
            } else {
                self.name = name
                self.monthsOld = monthsOld
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
//        optionals()

//        failableInitializers()

        optionalChaining()

    }

    func optionalChaining() {
        let address = Address()
        address.apartmentNumber = "1234"
        address.buildingNumber = "70"
        address.streetName = "Gaunt Street"

        let residence = Residence()
        residence.address = address

        let person = Person()
        person.residence = residence

        if let theResidence = person.residence {
            if let theAddress = theResidence.address {
                if let theApartmentNumber = theAddress.apartmentNumber {
                    print("He/she lives in apartment number \(theApartmentNumber).")
                }
            }
        }

//        if let theApartmentNumber = person.residence?.address?.apartmentNumber {
//            print("He/she lives in apartment number \(theApartmentNumber).")
//        }
    }

    func failableInitializers() {
        let possibleToddler = Toddler(name: "Joanna", monthsOld: 14)
        if let toddler = possibleToddler {
            print("\(toddler.name) is \(toddler.monthsOld) months old")
        } else {
            print("The age you specified for the toddler is not between 1 and 3 yrs of age")
        }
    }

    func optionals() {

//        let firstHarryPotter = Book(name: "Harry Potter and the Sorcerer's Stone", publicationYear: 1997, authorsFirstName: "Joanne", authorsMiddleName: nil, authorsLastName:"Rowling")
//        let secondHarryPotter = Book(name: "Harry Potter and the Chamber of Secrets", publicationYear: 1998, authorsFirstName: "Joanne", authorsMiddleName: nil, authorsLastName:"Rowling")
        let thirdHarryPotter = Book(name: "Harry Potter and the Prisoner of Azkaban", publicationYear: 1999, authorsFirstName: "Joanne", authorsMiddleName: nil, authorsLastName:"Rowling")

//        let books = [firstHarryPotter, secondHarryPotter, thirdHarryPotter]

        //Imagine we are building a screen that shows books that haven't been published yet? What do we do? 0?
        // Zero isn't accurate, because that would mean the book is over 2,000 years old.
        let unannouncedBook = Book(name: "The Hobbit", publicationYear: 0, authorsFirstName: "John", authorsMiddleName: "Ronald", authorsLastName: "Reuel")

        //Maybe?
        //        let unannouncedBookNil = Book(name: "Rebels and Lions", publicationYear: nil)

        let unannouncedBookNil = Book(name: "The Hobbit", publicationYear: nil, authorsFirstName: "John", authorsMiddleName: "Ronald", authorsLastName: "Reuel")

        //        var serverResponseCode = 404 //`Int`, not `Int?`
        //
        //        var serverResponseCode = nil //Error, no type specified when not `nil`
        //
        //        var serverResponseCode: Int? = 404 //Set to 404, but could be `nil` later
        //
        //        var serverResponseCode: Int? = nil //Set to `nil`, but could hold an `Int` later

        //        if publicationYear != nil { A feature that makes swift safe.
        //            let actualYear = publicationYear!
        //            print(actualYear)
        //        }

        //        let unwrappedYear = publicationYear! //runtime error the app would crash.
        //        print(unwrappedNumber)

        if let unwrappedPublicationYear = unannouncedBook.publicationYear {
            print("The book was published in \(unwrappedPublicationYear)")
        }

        if let unwrappedPublicationYear = unannouncedBookNil.publicationYear {
            print("The book was published in \(unwrappedPublicationYear)")
        }
        else {
            print("The book does not have an official publication date.")
        }

        printFullName(firstName: thirdHarryPotter.authorsFirstName, middleName: thirdHarryPotter.authorsMiddleName, lastName: thirdHarryPotter.authorsLastName)
    }

    func printFullName(firstName: String, middleName: String?, lastName: String){
//        print("The authors name is \(firstName) \(middleName) \(lastName)") // Show warning

        if let safeMiddleName = middleName {
            print("The authors name is \(firstName) \(safeMiddleName) \(lastName)") // Show warning
        }

        //->String

    }

}

