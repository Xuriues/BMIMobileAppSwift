//
//  LoginViewController.swift
//  Map_Project2
//
//  Created by Shaun on 7/8/20.
//  Copyright © 2020 Shaun. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var userName: UITextField!
   
    @IBOutlet weak var passWord: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.hideKeyboardWhenTappedAround()
        userName.delegate = self
        passWord.delegate = self
        view.backgroundColor = UIColor.tableColor
    }
    
    @IBAction func loginBtn(_ sender: Any) {

            if userName.text! != "" && passWord.text! != ""
            {
                if globalVar.checkExist(user: userName.text!, pass: passWord.text!)
                {
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let mainTabBarController = storyboard.instantiateViewController(identifier: "MainTabBarController")
                    (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
                    }
                    else
                    {
                        Alert.userLogin(on: self)
                    }
            }
            else
            {
                Alert.emptyField(on: self)
            }
        }
}
extension UIViewController : UITextFieldDelegate
{
    func hideKeyboardWhenTappedAround()
    {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
            tap.cancelsTouchesInView = false
            view.addGestureRecognizer(tap)
    }
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    @objc func dismissKeyboard()
    {
        view.endEditing(true)
    }
}
