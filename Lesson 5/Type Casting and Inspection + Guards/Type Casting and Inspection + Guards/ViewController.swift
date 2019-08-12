//
//  ViewController.swift
//  Type Casting and Inspection + Guards
//
//  Created by Dipesh Trikam on 12/08/19.
//  Copyright © 2019 Dipesh Trikam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // the type of "library" is inferred to be [MediaItem]

    let library = [
        Movie(name: "Casablanca", director: "Michael Curtiz"),
        Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
        Movie(name: "Citizen Kane", director: "Orson Welles"),
        Song(name: "The One And Only", artist: "Chesney Hawkes"),
        Song(name: "Never Gonna Give You Up", artist: "Rick Astley")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

//        checkType()
//
//        downCast()

//        typecastingForAny()
    }

    func checkType() {


        var movieCount = 0
        var songCount = 0

        for item in library {
            if item is Movie {
                movieCount += 1
            } else if item is Song {
                songCount += 1
            }
        }

        print("Media library contains \(movieCount) movies and \(songCount) songs")
        // Prints "Media library contains 2 movies and 3 songs"

    }

    func downCast() {
        for item in library {
            if let movie = item as? Movie {
                print("Movie: \(movie.name), dir. \(movie.director)")
            } else if let song = item as? Song {
                print("Song: \(song.name), by \(song.artist)")
            }
        }

        // Movie: Casablanca, dir. Michael Curtiz
        // Song: Blue Suede Shoes, by Elvis Presley
        // Movie: Citizen Kane, dir. Orson Welles
        // Song: The One And Only, by Chesney Hawkes
        // Song: Never Gonna Give You Up, by Rick Astley
    }

    func typecastingForAny() {
        var things = [Any]()

        things.append(0)
        things.append(0.0)
        things.append(42)
        things.append(3.14159)
        things.append("hello")
        things.append((3.0, 5.0))
        things.append(Movie(name: "Ghostbusters", director: "Ivan Reitman"))
        things.append({ (name: String) -> String in "Hello, \(name)" })

        for thing in things {
            switch thing {
            case 0 as Int:
                print("zero as an Int")
            case 0 as Double:
                print("zero as a Double")
            case let someInt as Int:
                print("an integer value of \(someInt)")
            case let someDouble as Double where someDouble > 0:
                print("a positive double value of \(someDouble)")
            case is Double:
                print("some other double value that I don't want to print")
            case let someString as String:
                print("a string value of \"\(someString)\"")
            case let (x, y) as (Double, Double):
                print("an (x, y) point at \(x), \(y)")
            case let movie as Movie:
                print("a movie called \(movie.name), dir. \(movie.director)")
            case let stringConverter as (String) -> String:
                print(stringConverter("Michael"))
            default:
                print("something else")
            }
        }

        // zero as an Int
        // zero as a Double
        // an integer value of 42
        // a positive double value of 3.14159
        // a string value of "hello"
        // an (x, y) point at 3.0, 5.0
        // a movie called Ghostbusters, dir. Ivan Reitman
        // Hello, Michael
    }


}

