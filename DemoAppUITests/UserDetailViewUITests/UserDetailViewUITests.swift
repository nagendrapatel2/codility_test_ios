//
//  UserDetailViewUITests.swift
//  DemoAppUITests
//
//  Created by Nagendra on 05/10/23.
//

import XCTest

final class UserDetailViewUITests: XCTestCase {
    var app : XCUIApplication!
    override  func setUp() {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments = ["_ui_testing"]
    }
    override func tearDown() {
        app = nil
    }
    
    func testUserListDetailViewGetSuccess(){
        app.launchEnvironment = ["networking_success" : "1"]
        app.launch()
        let userView = app.otherElements["userViewContent"]
        XCTAssertTrue(userView.waitForExistence(timeout: 5))
        let listview = app.collectionViews["userlist"]
        XCTAssertTrue(listview.exists)
        XCTAssertTrue(listview.cells.count == 1)
        let cell = listview.cells.buttons["userListCell"]
        XCTAssertTrue(cell.exists)
        let userName = cell.staticTexts["Kayla Lopez"]
        XCTAssertTrue(userName.exists)
        cell.tap()
        XCTAssertTrue(app.collectionViews.staticTexts["ID : 1"].exists)
        XCTAssertTrue(app.collectionViews.staticTexts["Job : Herbalist"].exists)
        XCTAssertTrue(app.collectionViews.staticTexts["Email : kayla.lopez.1@slingacademy.com"].exists)
        XCTAssertTrue(app.collectionViews.staticTexts["Gender : female"].exists)
        XCTAssertTrue(app.collectionViews.staticTexts["Street : 3388 Roger Wells Apt"].exists)
        XCTAssertTrue(app.collectionViews.staticTexts["City : Humphreyfurt"].exists)
        XCTAssertTrue(app.collectionViews.staticTexts["Zipcode : 79574"].exists)
        XCTAssertTrue(app.collectionViews.staticTexts["Country : Greenland"].exists)
        
    }
}
