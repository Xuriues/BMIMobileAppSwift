//
//  SignupViewController.swift
//  Map_Project2
//
//  Created by Shaun on 7/8/20.
//  Copyright © 2020 Shaun. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        view.backgroundColor = UIColor.tableColor
        username.delegate = self
        password.delegate = self
        self.hideKeyboardWhenTappedAround()
    }
    @IBAction func signUp(_ sender: Any)
    {
        if username.text != "" && password.text != ""
        {
            if(!globalVar.checkExist(user: username.text!, pass: password.text!))
            {
                globalVar.insertUser(user: username.text!, pass: password.text!)
                Alert.registered(on: self)
            }
            else
            {
                Alert.checkUser(on: self)
            }
        }
        else
        {
            Alert.emptyField(on: self)
        }
    }
    
    
    @IBAction func btnBack(_ sender: Any)
    {
        UIView.animate(withDuration: 1.0, delay: 0.0, options: UIView.AnimationOptions.curveEaseIn, animations: {
           
            let transition: CATransition = CATransition()
            transition.duration = 0.5
            transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
            transition.type = CATransitionType.moveIn
            transition.subtype = CATransitionSubtype.fromTop
            self.view.window!.layer.add(transition, forKey: nil)
            self.dismiss(animated: false, completion: nil)

        self.view.layer.add(transition, forKey: kCATransition)

        self.dismiss(animated: false, completion: nil)
        }, completion: nil)
    }
    
}
