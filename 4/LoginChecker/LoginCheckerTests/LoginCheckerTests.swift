//
//  LoginCheckerTests.swift
//  LoginCheckerTests
//
//  Created by Nikita Korobeinikov on 24.07.2020.
//  Copyright © 2020 NullIsOne. All rights reserved.
//

import XCTest
@testable import LoginChecker

class LoginCheckerTests: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }
    
    func testLogin_lessThanMinCharactersCount_invalid() throws {
        XCTAssertFalse(LoginChecker.isValid(login: String(repeating: "a", count: 2)))
    }
    
    func testLogin_hasMinCharactersCount_valid() throws {
        XCTAssertTrue(LoginChecker.isValid(login: String(repeating: "a", count: 3)))
    }
    
    func testLogin_hasMaxCharactersCount_valid() throws {
        XCTAssertTrue(LoginChecker.isValid(login: String(repeating: "a", count: 32)))
    }
    
    func testLogin_moreThanMaxCharactersCount_invalid() throws {
        XCTAssertFalse(LoginChecker.isValid(login: String(repeating: "a", count: 33)))
    }
    
    func testLogin_containsKirilicCharacters_invalid() throws {
        XCTAssertFalse(LoginChecker.isValid(login: "AnnOrАнна"))
        XCTAssertFalse(LoginChecker.isValid(login: "Борис"))
        XCTAssertFalse(LoginChecker.isValid(login: "Фёдор"))
    }
    
    func testLogin_containsSpecialCharacters_invalid() throws {
        XCTAssertFalse(LoginChecker.isValid(login: "Peace&Love"))
        XCTAssertFalse(LoginChecker.isValid(login: "**Guru**"))
        XCTAssertFalse(LoginChecker.isValid(login: "Dev/null"))
        XCTAssertFalse(LoginChecker.isValid(login: "50%"))
        XCTAssertFalse(LoginChecker.isValid(login: "50>100"))
        XCTAssertFalse(LoginChecker.isValid(login: "Strong:Guy"))
        XCTAssertFalse(LoginChecker.isValid(login: "Strong;Woman"))
        XCTAssertFalse(LoginChecker.isValid(login: "#Megacoder"))
    }
    
    func testLogin_containsEmailCharacters_valid() throws {
        XCTAssertTrue(LoginChecker.isValid(login: "someword@email.com"))
    }
    
    func testLogin_containsDot_valid() throws {
        XCTAssertTrue(LoginChecker.isValid(login: "email.com"))
    }
    
    func testLogin_containsDigitCharacters_valid() throws {
        for i in 0...10 {
            XCTAssertTrue(LoginChecker.isValid(login: "user\(i)"))
        }
    }
    
    func testLogin_containsMinusCharacters_valid() throws {
        XCTAssertTrue(LoginChecker.isValid(login: "big-brother"))
    }
    
    func testLogin_containsSpaceCharacters_invalid() throws {
        XCTAssertFalse(LoginChecker.isValid(login: "username username"))
    }
    
    func testLogin_startingWithDigit_invalid() throws {
        for i in 0...10 {
            XCTAssertFalse(LoginChecker.isValid(login: "\(i)username"))
        }
    }
    
    func testLogin_startingWithDot_invalid() throws {
        XCTAssertFalse(LoginChecker.isValid(login: ".username"))
    }
    
    func testLogin_startingWithMinus_invalid() throws {
        XCTAssertFalse(LoginChecker.isValid(login: "-username"))
    }

}
