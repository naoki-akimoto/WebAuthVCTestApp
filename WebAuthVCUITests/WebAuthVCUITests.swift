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

    func testSucceedLoginWithWebAuthFromModalView() {
        let app = XCUIApplication()
        let webNavCancel = app.buttons["Cancel"]
        XCTAssertFalse(webNavCancel.exists)
        let resultLabel = app.staticTexts["Result-Label"]
        let oldResult = resultLabel.label
        NSLog(oldResult)

        app.buttons["Open Custom Dialog"].tap()
        app.buttons["KiiUser.loginWithWebAuth"].tap()

        let webViewsQuery = app.webViews
        let pageCheck = webViewsQuery.staticTexts["SPTST"]
        do {
            let predicate = NSPredicate(format: "exists == true")
            let expect = expectation(for: predicate, evaluatedWith: pageCheck, handler: nil)
            XCTAssertEqual(XCTWaiter.wait(for: [expect], timeout: 10), .completed)
        }

        webViewsQuery.textFields["Username or email"].tap()
        webViewsQuery.textFields["Username or email"].typeText(TEST_USERNAME)
        webViewsQuery.secureTextFields["Password"].tap()
        webViewsQuery.secureTextFields["Password"].typeText(TEST_PASSWORD)
        webViewsQuery.buttons["Authorize app"].tap()

        do {
            let predicate = NSPredicate(format: "label != \"" + oldResult + "\"")
            let expect = expectation(for: predicate, evaluatedWith: resultLabel, handler: nil)
            XCTAssertEqual(XCTWaiter.wait(for: [expect], timeout: 10), .completed)
        }

        let newResult = resultLabel.label
        NSLog(newResult)
        XCTAssertTrue(newResult.starts(with: "KiiUser.login succeeded: "))
    }

    func testCancelLoginWithWebAuthFromModalView() {
        let app = XCUIApplication()
        let resultLabel = app.staticTexts["Result-Label"]
        let oldResult = resultLabel.label
        NSLog(oldResult)

        app.buttons["Open Custom Dialog"].tap()
        app.buttons["KiiUser.loginWithWebAuth"].tap()

        let webNavCancel = app.buttons["Cancel"]
        do {
            let predicate = NSPredicate(format: "exists == true")
            let expect = expectation(for: predicate, evaluatedWith: webNavCancel, handler: nil)
            XCTAssertEqual(XCTWaiter.wait(for: [expect], timeout: 10), .completed)
        }

        webNavCancel.tap()

        do {
            let predicate = NSPredicate(format: "label != \"" + oldResult + "\"")
            let expect = expectation(for: predicate, evaluatedWith: resultLabel, handler: nil)
            XCTAssertEqual(XCTWaiter.wait(for: [expect], timeout: 10), .completed)
        }

        let newResult = resultLabel.label
        NSLog(newResult)
        XCTAssertTrue(newResult.starts(with: "KiiUser.login failed: "))
    }

    func testSucceedWebAuthLoginNCFromModalView() {
        let app = XCUIApplication()
        let webNavCancel = app.buttons["Cancel"]
        XCTAssertFalse(webNavCancel.exists)
        let resultLabel = app.staticTexts["Result-Label"]
        let oldResult = resultLabel.label
        NSLog(oldResult)

        app.buttons["Open Custom Dialog"].tap()
        app.buttons["KiiUser.webAuthLoginVC"].tap()

        let webViewsQuery = app.webViews
        let pageCheck = webViewsQuery.staticTexts["SPTST"]
        do {
            let predicate = NSPredicate(format: "exists == true")
            let expect = expectation(for: predicate, evaluatedWith: pageCheck, handler: nil)
            XCTAssertEqual(XCTWaiter.wait(for: [expect], timeout: 10), .completed)
        }

        webViewsQuery.textFields["Username or email"].tap()
        webViewsQuery.textFields["Username or email"].typeText(TEST_USERNAME)
        webViewsQuery.secureTextFields["Password"].tap()
        webViewsQuery.secureTextFields["Password"].typeText(TEST_PASSWORD)
        webViewsQuery.buttons["Authorize app"].tap()

        do {
            let predicate = NSPredicate(format: "label != \"" + oldResult + "\"")
            let expect = expectation(for: predicate, evaluatedWith: resultLabel, handler: nil)
            XCTAssertEqual(XCTWaiter.wait(for: [expect], timeout: 10), .completed)
        }

        let newResult = resultLabel.label
        NSLog(newResult)
        XCTAssertTrue(newResult.starts(with: "KiiUser.webAuthLoginNavigationController succeeded: "))
    }

    func testCancelWebAuthLoginNCFromModalView() {
        let app = XCUIApplication()
        let resultLabel = app.staticTexts["Result-Label"]
        let oldResult = resultLabel.label
        NSLog(oldResult)

        app.buttons["Open Custom Dialog"].tap()
        app.buttons["KiiUser.webAuthLoginVC"].tap()

        let webNavCancel = app.buttons["Cancel"]
        do {
            let predicate = NSPredicate(format: "exists == true")
            let expect = expectation(for: predicate, evaluatedWith: webNavCancel, handler: nil)
            XCTAssertEqual(XCTWaiter.wait(for: [expect], timeout: 10), .completed)
        }

        webNavCancel.tap()

        do {
            let predicate = NSPredicate(format: "label != \"" + oldResult + "\"")
            let expect = expectation(for: predicate, evaluatedWith: resultLabel, handler: nil)
            XCTAssertEqual(XCTWaiter.wait(for: [expect], timeout: 10), .completed)
        }

        let newResult = resultLabel.label
        NSLog(newResult)
        XCTAssertTrue(newResult.starts(with: "KiiUser.webAuthLoginNavigationController failed: "))
    }
}
