//
//  WebAuthVCUITests.swift
//  WebAuthVCUITests
//
//  Created on 2017/09/08.
//
//

import XCTest

class WebAuthVCUITests: XCTestCase {

    let TEST_USERNAME = "{your username}"
    let TEST_PASSWORD = "{your password}"

    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        
        let app = XCUIApplication()
        app.buttons["Open Custom Dialog"].tap()
        app.buttons["New one"].tap()
        
        let webViewsQuery = app.webViews
        XCTAssertNotNil(webViewsQuery.textViews["Authorize SPTST to use yout account?"])
        webViewsQuery.textFields["Username or email"].tap()
        app.typeText(TEST_USERNAME)
        webViewsQuery.secureTextFields["Password"].tap()
        app.typeText(TEST_PASSWORD)
        webViewsQuery.buttons["Authorize app"].tap()
    }
    
}
