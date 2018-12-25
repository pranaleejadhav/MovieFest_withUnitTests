//
//  MovieStructTests.swift
//  MovieFestTests
//
//  Created by Pranalee Jadhav on 12/25/18.
//  Copyright © 2018 Pranalee Jadhav. All rights reserved.
//

import XCTest
@testable import MovieFest

class MovieStructTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInit_MovieWithTitle() {
        let testMovie = Movie(title: "Wonder Woman")
        
        XCTAssertNotNil(testMovie)
        XCTAssertEqual(testMovie.title, "Wonder Woman")
    }
    
    func testInit_SetMovieTtitleAndReleaseDate() {
        let testMovie = Movie(title: "Wonder Woman", releaseDate: "2017")
        
        XCTAssertEqual(testMovie.releaseDate, "2017")
        
    }
    
    func testEquatable_ReturnsNotEqualForDifferentTitles() {
        let actionMovie1 = Movie(title: "Action")
        let actionMovie2 = Movie(title: "Adventure")
        
        XCTAssertNotEqual(actionMovie1, actionMovie2)
    }
    
    func testEquatable_ReturnsNotEqualForDifferentReleaseDates() {
        let actionMovie1 = Movie(title: "Action", releaseDate: "1999")
        let actionMovie2 = Movie(title: "Action", releaseDate: "2018")
        
        XCTAssertNotEqual(actionMovie1, actionMovie2)
    }

}
