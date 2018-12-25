//
//  MoviesViewController.swift
//  MovieFestTests
//
//  Created by Pranalee Jadhav on 12/25/18.
//  Copyright © 2018 Pranalee Jadhav. All rights reserved.
//

import XCTest
@testable import MovieFest


class MoviesViewControllerTests: XCTestCase {

    var moviesViewController: MoviesViewController!
    
    override func setUp() {
      // super.setUp()
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MoviesViewController")
        moviesViewController = vc as? MoviesViewController
        
        _ = moviesViewController.view
    
        
     }

    override func tearDown() {
       // super.tearDown()
    }
    
    // MARK: Nil tableview
    func testMoviesVC_TableViewShouldNotBeNil() {
        XCTAssertNotNil(moviesViewController.tableView)
    }
    
    // MARK: Data Source
    func testDataSource_ViewDidLoad_SetsTableViewDataSource() {
        XCTAssertNotNil(moviesViewController.tableView.dataSource)
        XCTAssertTrue(moviesViewController.tableView.dataSource is MovieLibraryDataService)
    }
    
    // MARK: Delegate
    func testDelegate_ViewDidLoad_SetsTableViewDelegate() {
        XCTAssertNotNil(moviesViewController.tableView.delegate)
        XCTAssertTrue(moviesViewController.tableView.delegate is MovieLibraryDataService)
    }
    
    // MARK: Data Service Assumptions
    func testDataService_ViewDidLoad_SingleDataServiceObject() {
        XCTAssertEqual(moviesViewController.tableView.dataSource as! MovieLibraryDataService, moviesViewController.tableView.delegate as! MovieLibraryDataService)
    }

    

}
