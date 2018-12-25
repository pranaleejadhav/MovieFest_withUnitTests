//
//  MovieLibraryDataService.swift
//  MovieFest
//
//  Created by Pranalee Jadhav on 12/25/18.
//  Copyright © 2018 Pranalee Jadhav. All rights reserved.
//

import UIKit

enum LibrarySection: Int {
    case MoviesToSee, MoviesSeen
}

class MovieLibraryDataService: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    var movieManager: MovieManager?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let movieManager = movieManager else {
            return 0
        }
        
        guard let movieSection = LibrarySection(rawValue: section) else {
            fatalError()
        }
        
        switch movieSection {
        case .MoviesToSee:
            return movieManager.moviesToSeeCount
        case .MoviesSeen:
            return movieManager.moviesSeenCount
        }
        
       
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCellID", for: indexPath) as! MovieCellTableViewCell
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    

}
