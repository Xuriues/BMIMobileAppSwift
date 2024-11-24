//
//  Map_Project2Tests.swift
//  Map_Project2Tests
//
//  Created by Shaun on 7/8/20.
//  Copyright © 2020 Shaun. All rights reserved.
//

import XCTest
@testable import Map_Project2

class Map_Project2Tests: XCTestCase {
   
    var login = loginBank()
    var global:Person = Person()
    
    
    func testRegister() throws
    {
        let insertUSer = LoginData.init(userName: "Test", passWord: "Test")
        login.accounts.append(insertUSer)
        XCTAssertTrue(login.checkExist(user: "Test", pass: "Test"))
    }
    
    func testcaluclateBMI() throws
    {
        let bmi = Int(global.calculateBMI(sliderval: Int(60.0), textval: 1.75))
        XCTAssert(bmi == 19)
    }
    func testCalorieMale() throws
    {
        // 0 for male
        let calorieMale = Int(global.calculateCalorie(w: 88, h: 1.77, age: 20, pa: 1.0,genderIndex: 0))
        XCTAssert(calorieMale == 2809)
    }
    func testcalorieFemale() throws
    {
        // 1 for female
        let calorieFemale = Int(global.calculateCalorie(w: 45, h: 1.65, age: 20, pa: 1.14, genderIndex: 1))
        XCTAssert(calorieFemale == 2042)
    }
}
