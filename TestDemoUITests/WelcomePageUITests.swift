//
//  WelcomePageUITests.swift
//  TestDemoUITests
//
//  Created by Denis Onofras on 17.08.22.
//

import XCTest

class WelcomePageUITests: XCTestCase {
    
    let app = XCUIApplication()


    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    override func tearDownWithError() throws {
        
    }
    
    func testWelcome() throws {
        let welcome = app.staticTexts.element
        
        XCTAssert(welcome.exists)
        XCTAssertEqual(welcome.label, "Welcome Page!")
    }
    
    func testLoginButton() throws {
        let login = app.buttons["loginButton"]
     
        XCTAssert(login.exists)
    }
    
    func testRegisterButton() throws {
        let register = app.buttons["registerButton"]
     
        XCTAssert(register.exists)
    }
    
    func testLoginFormAppearance() throws {
        app.buttons["loginButton"].tap()
        let loginNavBarTitle = app.staticTexts["Login"]
        
        XCTAssert(loginNavBarTitle.waitForExistence(timeout: 0.5))
    }
    
    func testRegisterFormAppearance() throws {
        app.buttons["registerButton"].tap()
        let loginNavBarTitle = app.staticTexts["Register"]
        
        XCTAssert(loginNavBarTitle.waitForExistence(timeout: 0.5))
    }

    func testWelcomeAfterLogin() throws {
        XCTAssert(app.staticTexts["Welcome Page!"].exists)
     
        try login()
     
        XCTAssert(app.staticTexts["Welcome test!"].exists)
    }

    func testTextSize() throws {
        try login()
     
        let textSize = app.sliders["slider"]
        XCTAssert(textSize.exists)
     
        textSize.adjust(toNormalizedSliderPosition: 0.75)
        XCTAssertGreaterThanOrEqual(textSize.value as! String, "0.7")
    }
    
    func testColorTheme() throws {
        try login()

        let colorTheme = app.segmentedControls["colorTheme"]
        XCTAssert(colorTheme.exists)
        XCTAssert(colorTheme.buttons["Light"].isSelected)

        colorTheme.buttons["Dark"].tap()
        XCTAssert(colorTheme.buttons["Dark"].isSelected)
    }
    
    func testFontPicker() throws {
        try login()
     
        let wheel = app.pickers["fontPicker"].pickerWheels.element
        XCTAssert(wheel.exists)
        XCTAssertEqual(wheel.value as! String, "Arial")
     
        wheel.adjust(toPickerWheelValue: "Futura")
        XCTAssertEqual(wheel.value as! String, "Futura")
    }
    
    private func login() throws {
        app.buttons["loginButton"].tap()
        
        let username = app.textFields["Username"]
        username.tap()
        username.typeText("test")
        
        let password = app.secureTextFields["Password"]
        password.tap()
        password.typeText("pass")
        app.keyboards.buttons["Return"].tap()
        
        let loginButton = app.buttons["loginNowButton"]
        loginButton.tap()
    }
}
