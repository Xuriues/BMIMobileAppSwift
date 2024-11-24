//
//  PassData.swift
//  Map_Project2
//
//  Created by Shaun on 7/8/20.
//  Copyright © 2020 Shaun. All rights reserved.
//

import Foundation

var history:[String] = [""]

class Person
{
 
    enum GenderSelected
    {
        static let maleArray:[Double] = [1.0,1.12,1.27,1.54]
        static let femaleArray:[Double] = [1.0,1.14,1.27,1.45]
    }
    
    var gender:Int = 0
    var height:Double = 0
    var weight:Int = 0
    var PA:Double = 0
    var Age:Int = 0
    
    func resetAll()
    {
        gender = 0
        height = 0
        weight = 0
        PA = 0
        Age = 0
    }
    
    func calculateBMI(sliderval:Int, textval:Double) -> Double
    {
        var BMI:Double = 0
        BMI =  Double(sliderval) / (textval * textval)
        return BMI
    }
    func calculateCalorie(w:Int, h:Double,age:Int,pa:Double, genderIndex:Int)->Double
    {
        if genderIndex == 0
        {
              
            return 864 - 9.72 * Double(age) + pa * (14.2 * Double(w) + 503 * h)
        }
        else
        {
            return 387 - 7.31 * Double(age) + pa * (10.9 * Double(w) + 660.7 * h)
        }
    }
    
}
var globalPerson:Person = Person()
class LoginData
{
    var username:String?
    var password:String?
    
    
    init(userName:String , passWord:String) {
        self.username = userName
        self.password = passWord
    }
}
class loginBank
{
    var accounts = [LoginData(userName: "Admin", passWord: "Admin")]
    func insertUser(user:String , pass:String)
    {
        let tempData = LoginData(userName:user, passWord:pass)
        accounts.append(tempData)
    }
    func checkExist(user:String, pass:String)-> Bool
    {
        var flag = false
        for users in accounts
        {
            if(users.username! == user && users.password! == pass)
            {
                flag = true
            }
        }
        return flag
    }
}
var globalVar = loginBank()
