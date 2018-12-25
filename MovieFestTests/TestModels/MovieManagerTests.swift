//
//  MovieManagerTests.swift
//  MovieFestTests
//
//  Created by Pranalee Jadhav on 12/25/18.
//  Copyright © 2018 Pranalee Jadhav. All rights reserved.
//

import XCTest
@testable import MovieFest

class MovieManagerTests: XCTestCase {

    var movieManager: MovieManager!
    let testMovie1 = Movie(title: "Wonder Woman")
    let testMovie2 = Movie(title: "Spiderman")
    let scifiMovie = Movie(title: "Sci-Fi")
    let arthouseMovie = Movie(title: "Arthouse Drama")
    let actionMovie = Movie(title: "Action/Adventure")
    
    override func setUp() {
        super.setUp()
        movieManager = MovieManager()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    //MARK: Initial Values
    func testInit_MoviesToSee_ReturnsZero() {
        
        XCTAssertEqual(movieManager.moviesToSeeCount, 0)
    }
    
    
    func testInit_MoviesSeen_ReturnsZero() {
        
        XCTAssertEqual(movieManager.moviesSeenCount, 0)
    }
    
    //MARK: Add & Query
    func testAdd_MoviesToSee_ReturnsOne() {
        
         movieManager.addMovie(movie: testMovie1)
        
         XCTAssertEqual(movieManager.moviesToSeeCount, 1)
    }
    
    func testQuery_ReturnsMovieAtIndex() {
        
        movieManager.addMovie(movie: testMovie1)
        
        let movieQueried = movieManager.movieAtIndex(index: 0)
        XCTAssertEqual(testMovie1.title, movieQueried.title)
    }
    
    //MARK: Checking Off
    func testCheckOffMovie_UpdatesMovieManagerCounts() {
        
        movieManager.addMovie(movie: testMovie1)
        movieManager.checkOffMovieAtIndex(0)
        
        XCTAssertEqual(movieManager.moviesToSeeCount, 0)
        XCTAssertEqual(movieManager.moviesSeenCount, 1)
        
    }
    
    func testCheckOffMovie_RemovesMovieFromArray() {
         movieManager.addMovie(movie: testMovie1)
         movieManager.addMovie(movie: testMovie2)
        
        movieManager.checkOffMovieAtIndex(0)
        
        
        XCTAssertEqual(movieManager.movieAtIndex(index: 0).title, testMovie2.title)
       
    }
    
    func testCheckOffMovie_ReturnsMovieAtIndex() {
        movieManager.addMovie(movie: testMovie1)
        movieManager.addMovie(movie: testMovie2)
        movieManager.checkOffMovieAtIndex(0)
        
        XCTAssertEqual(movieManager.checkedOffMovieAtIndex(0).title, testMovie1.title)
        
    }
    
    // MARK: Clearing & Resetting
    func testClearArrays_ReturnsArrayCountsOfZero() {
        movieManager.addMovie(movie: scifiMovie)
        movieManager.addMovie(movie: actionMovie)
        movieManager.checkOffMovieAtIndex(0)
        
        XCTAssertEqual(movieManager.moviesToSeeCount, 1)
        XCTAssertEqual(movieManager.moviesSeenCount, 1)
        
        movieManager.clearArrays()
        
        XCTAssertEqual(movieManager.moviesToSeeCount, 0)
        XCTAssertEqual(movieManager.moviesSeenCount, 0)
    }
    
    // MARK: Duplicates
    func testDuplicateMovies_ShouldNotBeAddedToArray() {
        movieManager.addMovie(movie: scifiMovie)
        movieManager.addMovie(movie: scifiMovie)
        
        XCTAssertEqual(movieManager.moviesToSeeCount, 1)
    }
    
    

}
