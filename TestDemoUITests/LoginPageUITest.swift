//
//  LoginPageUITest.swift
//  TestDemoUITests
//
//  Created by Denis Onofras on 17.08.22.
//

import XCTest

class LoginPageUITest: XCTestCase {

    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        
        app.launch()
        app.buttons["loginButton"].tap()
    }

    override func tearDownWithError() throws {
        
    }
    
    func testLoginForm() throws {
        let navBar = app.navigationBars.element
        XCTAssert(navBar.exists)

        let username = app.textFields["Username"]
        XCTAssert(username.exists)

        let password = app.secureTextFields["Password"]
        XCTAssert(password.exists)

        let login = app.buttons["loginNowButton"]
        XCTAssert(login.exists)
        XCTAssertEqual(login.label, "Login")

        let dismiss = app.buttons["Dismiss"]
        XCTAssert(dismiss.exists)
    }
    
    func testLoginDismiss() throws {
        let dismiss = app.buttons["Dismiss"]
        dismiss.tap()
        XCTAssertFalse(dismiss.waitForExistence(timeout: 0.5))
    }
    
    func testUsername() throws {
        let username = app.textFields["Username"]
        username.tap()
        username.typeText("test")
     
        XCTAssertNotEqual(username.value as! String, "")
    }
    
    func testPassword() throws {
        let password = app.secureTextFields["Password"]
        password.tap()
        password.typeText("pass")
        app.keyboards.buttons["Return"].tap()
     
        XCTAssertNotEqual(password.value as! String, "")
    }
    
    func testLogin() throws {
        let username = app.textFields["Username"]
        username.tap()
        username.typeText("test")

        let password = app.secureTextFields["Password"]
        password.tap()
        password.typeText("pass")
        app.keyboards.buttons["Return"].tap()

        let loginButton = app.buttons["loginNowButton"]
        loginButton.tap()

        XCTAssertFalse(loginButton.waitForExistence(timeout: 0.5))
    }
    
    func testFailedLoginAlert() throws {
        app.buttons["loginNowButton"].tap()

        XCTAssert(app.alerts.element.waitForExistence(timeout: 0.5))

        app.alerts.element.buttons["OK"].tap()
        XCTAssertFalse(app.alerts.element.exists)
    }
}
