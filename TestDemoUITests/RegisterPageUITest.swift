//
//  RegisterPageUITest.swift
//  TestDemoUITests
//
//  Created by Denis Onofras on 17.08.22.
//

import XCTest

class RegisterPageUITest: XCTestCase {

    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        
        app.launch()
        app.buttons["loginButton"].tap()
    }

    override func tearDownWithError() throws {
        
    }
    
    func testRegisterForm() throws {
        let navBar = app.navigationBars.element
        XCTAssert(navBar.exists)

        let username = app.textFields["Username"]
        XCTAssert(username.exists)

        let password = app.secureTextFields["Password"]
        XCTAssert(password.exists)
        
        let confirmPassword = app.secureTextFields["Confirm Password"]
        XCTAssert(confirmPassword.exists)

        let login = app.buttons["registerNowButton"]
        XCTAssert(login.exists)
        XCTAssertEqual(login.label, "Register")

        let dismiss = app.buttons["Dismiss"]
        XCTAssert(dismiss.exists)
    }
}
