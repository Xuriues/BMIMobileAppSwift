//
//  BMIViewController.swift
//  Map_Project2
//
//  Created by Shaun on 7/8/20.
//  Copyright © 2020 Shaun. All rights reserved.
//

import UIKit

class BMIViewController: UIViewController {
    //Buttons etc
    
    @IBOutlet weak var heightText: UITextField!
    
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    //Variables
    var mIndex:Int = 0
    var cmIndex:Int = 0
    var pickerView =  UIPickerView()
    let meter = Array(1...3)
    let center = Array(10...99)
    let numberOfComponents = 4
    
    var doubleText:Double?
    var slidervalue:Int?
    
    func setupText()
    {
        heightText.leftViewMode = .always
        
        let heightView = UIImageView()
        let heightImage = UIImage(named: "height")
        heightView.image = heightImage
        
        heightView.frame = CGRect(x: 5, y: 5, width: heightText.frame.height, height: heightText.frame.height)
        heightText.leftView = heightView
    }
    @IBOutlet weak var testresult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.delegate = self
        pickerView.dataSource = self
        heightText.inputView = pickerView
        pickerView.backgroundColor = UIColor.bgColor
        
        globalPerson.resetAll()
        
        createToolBar()
        setupText()
        backGround()
        self.hideKeyboardWhenTappedAround()
    }
    let backgroundImageView = UIImageView()
    
    func backGround()
    {
        view.addSubview(backgroundImageView)
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        backgroundImageView.backgroundColor = UIColor.bgColor
        backgroundImageView.image = UIImage(named: "bgColorCrop")
        view.sendSubviewToBack(backgroundImageView)
    }
    func createToolBar()
    {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        toolBar.barTintColor = UIColor.darkbgColor
        toolBar.tintColor = .white
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(BMIViewController.dismissKeyboard))
        
        toolBar.setItems([doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        heightText.inputAccessoryView = toolBar
    }
    @objc override func dismissKeyboard()
    {
        view.endEditing(true)
    }
    @IBAction func sliderXd(_ sender: Any) {
        let val = Int(slider.value)
        weightLabel.text = "Weight : \(val)"
    }
    
    
    @IBAction func logout(_ sender: Any)
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let loginNavController = storyboard.instantiateViewController(identifier: "LoginNavigationController")
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(loginNavController)
        history.removeAll()
    }
    
    
    @IBAction func calculate(_ sender: Any) {
        if heightText.text != ""
        {
            if slider.value != 1.0
            {
                doubleText = Double(heightText.text!)
                slidervalue = Int(slider.value)
                if doubleText != nil
                {
                    if heightText!.text!.contains(".")
                    {
                        cal()
                    }
                    else
                    {
                        doubleText = doubleText! / 100
                        cal()
                    }
                }
                else
                {
                    Alert.heightDecimal(on: self)
                }
            }
            else
            {
                Alert.leftEmpty(on: self, empty: "Weight")
            }
        }
        else
        {
            Alert.leftEmpty(on: self, empty: "Height")
        }
    }
    
    func cal()
    {
        globalPerson.height = doubleText!
        globalPerson.weight = slidervalue!
        performSegue(withIdentifier: "bmi", sender: nil)
        //testresult.text = "\(qwerty.height) \(qwerty.weight)"
    }
}


extension BMIViewController: UIPickerViewDelegate,UIPickerViewDataSource
{
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return numberOfComponents
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        if component == 0 {
            return meter.count
        }else if component == 2 {
            return center.count
        }else {
            return 1
        }
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        if component == 0 {
            return "\(meter[row])"
        }else if component == 1 {
            return "M"
        }else if component == 2 {
            return "\(center[row])"
        }else {
            return "CM"
        }
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        let meterIndex = pickerView.selectedRow(inComponent: 0)
        let centerIndex = pickerView.selectedRow(inComponent: 2)
        mIndex = Int(meter[meterIndex])
        cmIndex = Int(center[centerIndex])
        heightText.text = "\(meter[meterIndex]).\(center[centerIndex])"
    }
    
}
