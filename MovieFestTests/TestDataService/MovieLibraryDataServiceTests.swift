//
//  MovieLibraryDataServiceTests.swift
//  MovieFestTests
//
//  Created by Pranalee Jadhav on 12/25/18.
//  Copyright © 2018 Pranalee Jadhav. All rights reserved.
//

import XCTest
@testable import MovieFest

class MovieLibraryDataServiceTests: XCTestCase {
    
    var dataService: MovieLibraryDataService!
    let testMovie1 = Movie(title: "Wonder Woman")
    let testMovie2 = Movie(title: "Spiderman")
    var tableView: UITableView!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        dataService = MovieLibraryDataService()
        dataService.movieManager = MovieManager()
        tableView = UITableView()
        tableView.dataSource = dataService
        tableView.delegate = dataService
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testTableViewSections_Count_ReturnsTwo() {
        
        let sections = tableView.numberOfSections
        XCTAssertEqual(sections, 2)

    }
    
    func testTableViewSections_SectionOne_RowCount_ReturnsTwo() {
        dataService.movieManager?.addMovie(movie: testMovie1)
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 1)
        
         dataService.movieManager?.addMovie(movie: testMovie2)
        tableView.reloadData()
        
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 2)
        
    }

    func testTableViewSections_SectionTwo_ReturnsMoviesSeenCount() {
        dataService.movieManager?.addMovie(movie: testMovie1)
        dataService.movieManager?.addMovie(movie: testMovie2)
        dataService.movieManager?.checkOffMovieAtIndex(0)
        XCTAssertEqual(tableView.numberOfRows(inSection: 1), 1)
        
        dataService.movieManager?.checkOffMovieAtIndex(0)
        tableView.reloadData()
        XCTAssertEqual(tableView.numberOfRows(inSection: 1), 2)
    }
    
    // MARK: Cells
    func testCell_RowAtIndex_ReturnsMovieCell() {
        dataService.movieManager?.addMovie(movie: testMovie1)
        tableView.reloadData()
        
        let cellQueried = tableView.cellForRow(at: IndexPath(row: 0, section: 0))
        XCTAssertTrue(cellQueried is MovieCellTableViewCell)
    }


}
