//
//  Movie.swift
//  MovieFest
//
//  Created by Pranalee Jadhav on 12/25/18.
//  Copyright © 2018 Pranalee Jadhav. All rights reserved.
//

import Foundation

struct Movie: Equatable {
    let title: String
    let releaseDate: String?
    
    init(title: String, releaseDate: String? = nil) {
        self.title = title
        self.releaseDate = releaseDate
    }
    
}


func ==(lhs: Movie, rhs: Movie) -> Bool {
    if lhs.title == rhs.title && lhs.releaseDate == rhs.releaseDate {
        return true
    }
    
    return false
}
