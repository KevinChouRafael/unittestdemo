//
//  UnitTestUITests.swift
//  UnitTestUITests
//
//  Created by rafael on 6/14/16.
//  Copyright © 2016 kevin. All rights reserved.
//

import XCTest

class UnitTestUITests: XCTestCase {
    
    // application:
    var app:XCUIApplication!
    
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app = XCUIApplication()
        app.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        

    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        
        let label = app.staticTexts["First View"]
        XCTAssertTrue(label.exists)
        XCTAssertEqual(label.label,"First View")
        
        
        
        let tabBarsQuery = app.tabBars
        tabBarsQuery.buttons["Second"].tap()
        tabBarsQuery.buttons["First"].tap()
        
        
        let textField =  app.textFields.matchingType(.TextField, identifier: "nameTextField").element
        XCTAssertTrue(textField.exists)
        textField.tap()
        textField.typeText("123456")

        XCTAssertEqual(textField.value as? String, "123456")


        app.buttons["Button"].tap()
        
        
        XCTAssertTrue(app.staticTexts["123456"].exists)
//        XCTAssertEqual(label.label,"123456")
        
    }
    
}
