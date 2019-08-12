//
//  MediaItem.swift
//  Type Casting and Inspection + Guards
//
//  Created by Dipesh Trikam on 12/08/19.
//  Copyright © 2019 Dipesh Trikam. All rights reserved.
//

import Foundation

class MediaItem {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class Movie: MediaItem {
    var director: String
    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
}

class Song: MediaItem {
    var artist: String
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}
