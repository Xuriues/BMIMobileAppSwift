//
//  Alert.swift
//  Map_Project2
//
//  Created by Shaun on 31/8/20.
//  Copyright © 2020 Shaun. All rights reserved.
//

import Foundation
import UIKit



struct Alert
{
    private static func alertPopup(on vc:UIViewController,with title: String, message: String)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        vc.present(alert, animated: true)
    }
    static func userLogin(on vc:UIViewController)
    {
        alertPopup(on: vc, with: "Error", message: "Invalid username or password.")
    }
    static func checkUser(on vc:UIViewController)
    {
        alertPopup(on: vc, with: "Error", message: "Username and password is already taken.")
    }
    static func emptyField(on vc:UIViewController)
    {
        alertPopup(on: vc, with: "Error", message: "Please fill in all textfield to proceed.")
    }
    static func registered(on vc:UIViewController)
    {
        alertPopup(on: vc, with: "Yay!", message: "You've registered successfully head back to login page!")
    }
    static func pickerOption(on vc:UIViewController)
    {
        alertPopup(on: vc, with: "Error", message: "Only select the options that are given to you.")
    }
    static func numeric(on vc:UIViewController, error:String)
    {
        alertPopup(on: vc, with: "Error", message: "\(error) must be in numeric")
    }
    static func heightDecimal(on vc:UIViewController)
    {
        alertPopup(on: vc, with: "Error", message: "Height must be in numeric deicmal.")
    }
    static func leftEmpty(on vc:UIViewController, empty:String)
    {
        alertPopup(on: vc, with: "Error", message: "\(empty) cannot be left empty.")
    }
    static func unrealistic(on vc: UIViewController, message:String)
    {
        alertPopup(on: vc, with: "Unrealistic", message: "Please enter your ACTUAL \(message).")
    }
}
