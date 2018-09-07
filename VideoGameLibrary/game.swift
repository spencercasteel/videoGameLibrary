//
//  game.swift
//  VideoGameLibrary
//
//  Created by Spencer Casteel on 9/4/18.
//  Copyright © 2018 Spencer Casteel. All rights reserved.
//

import Foundation

class Game {
    var title: String
    
    var checkedIn = true
    
    var dueDate: Date?
    
    var rating: String
    
    init(title: String, rating: String) {
        self.title = title
        self.rating = rating
    }
}
