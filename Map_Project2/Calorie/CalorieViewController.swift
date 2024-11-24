//
//  CalorieViewController.swift
//  Map_Project2
//
//  Created by Shaun on 7/8/20.
//  Copyright © 2020 Shaun. All rights reserved.
//

import UIKit

class CalorieViewController: UIViewController
{
    //outlet
    @IBOutlet weak var gender: UISegmentedControl!
    @IBOutlet weak var heightText: UITextField!
    @IBOutlet weak var weightText: UITextField!
    @IBOutlet weak var ageText: UITextField!
    @IBOutlet weak var paText: UITextField!
    //Pickerview
    var heightPicker = UIPickerView()
    var weightPicker = UIPickerView()
    var agePicker = UIPickerView()
    var paPicker = UIPickerView()
    let toolBar = UIToolbar()
    let backgroundImageView = UIImageView()

    // Arrays and variables
    var heightArray = Array(100...300)
    var weightArray = Array(1...300)
    var ageArray = Array(1...120)
    var paArray:[Double] = [1.0,1.12,1.27,1.54]
    var paDisplay:[String] = ["Sendentary", "Low Active","Active","Very Active"]
    let meter = Array(1...3)
    let center = Array(10...99)
    let numberOfComponents = 4
    
    var heightToInt:Double?
    var weightToInt:Int?
    var ageToInt:Int?
    var paToInt:Double?
    var realHeight:Double?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        globalPerson.resetAll()
        createPicker()
        createToolBar()
        backGround()
        self.hideKeyboardWhenTappedAround()
        heightPicker.backgroundColor = UIColor.darkMale
        weightPicker.backgroundColor = UIColor.darkMale
        agePicker.backgroundColor = UIColor.darkMale
        paPicker.backgroundColor = UIColor.darkMale
    }
    @IBOutlet weak var testresult: UILabel!
    @IBAction func genderSwitch(_ sender: Any)
    {
        if gender.selectedSegmentIndex == 0
        {
            paArray.removeAll()
            paArray.append(contentsOf: Person.GenderSelected.maleArray)
            colorPicker()
            clearAll()
        }
        else if gender.selectedSegmentIndex == 1
        {
            backgroundImageView.backgroundColor = UIColor.femaleColor
            paArray.removeAll()
            paArray.append(contentsOf: Person.GenderSelected.femaleArray)
            colorPicker()
            clearAll()
        }
    }
    func colorPicker()
    {
        if gender.selectedSegmentIndex == 0
        {
            toolBar.barTintColor = UIColor.tintMale
            heightPicker.backgroundColor = UIColor.darkMale
            weightPicker.backgroundColor = UIColor.darkMale
            agePicker.backgroundColor = UIColor.darkMale
            paPicker.backgroundColor = UIColor.darkMale
            backgroundImageView.backgroundColor = UIColor.maleColor
        }
        else if gender.selectedSegmentIndex == 1
        {
            toolBar.barTintColor = UIColor.tintFemale
            heightPicker.backgroundColor = UIColor.darkFemale
            weightPicker.backgroundColor = UIColor.darkFemale
            agePicker.backgroundColor = UIColor.darkFemale
            paPicker.backgroundColor = UIColor.darkFemale
        }
    }
    func clearAll()
    {
        heightText.text = ""
        weightText.text = ""
        ageText.text = ""
        paText.text = ""
    }
    
    func backGround()
    {
        view.addSubview(backgroundImageView)
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        backgroundImageView.backgroundColor = UIColor.maleColor
        backgroundImageView.image = UIImage(named: "bgColorCrop")
        view.sendSubviewToBack(backgroundImageView)
    }
    func createPicker()
    {
        heightText.inputView = heightPicker
        weightText.inputView = weightPicker
        ageText.inputView = agePicker
        paText.inputView = paPicker
        
        heightPicker.delegate = self
        heightPicker.dataSource = self
        weightPicker.dataSource = self
        weightPicker.delegate = self
        agePicker.delegate = self
        agePicker.dataSource = self
        paPicker.delegate = self
        paPicker.dataSource = self
        
        heightPicker.tag = 1
        weightPicker.tag = 2
        agePicker.tag = 3
        paPicker.tag = 4
        
        heightText.placeholder = "Height In CM"
        weightText.placeholder = "Weight In KG"
        ageText.placeholder = "Age In Years"
        paText.placeholder = "Roughly Est"
        
        globalPerson.Age = 0
        globalPerson.PA = 0
        globalPerson.height = 0
        globalPerson.weight = 0
    }
    
    func createToolBar()
    {
        toolBar.sizeToFit()
        let donebutton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(CalorieViewController.dismissKeyboard))
        toolBar.setItems([donebutton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        toolBar.barTintColor = UIColor.tintMale
        toolBar.tintColor = .white

        heightText.inputAccessoryView = toolBar
        weightText.inputAccessoryView = toolBar
        ageText.inputAccessoryView = toolBar
        paText.inputAccessoryView = toolBar
    }
    @objc override func dismissKeyboard()
    {
        view.endEditing(true)
    }
    
    @IBAction func calorieCal(_ sender: Any)
    {
        if heightText.text != "" && weightText.text != "" && ageText.text != "" && paText.text != ""
        {
            heightToInt = Double(heightText.text!)
            weightToInt = Int(weightText.text!)
            ageToInt = Int(ageText.text!)
            paToInt = Double(paText.text!)
            if heightToInt != nil
            {
                if weightToInt != nil
                {
                    if ageToInt != nil
                    {
                        if heightToInt! < 1.0 || heightToInt! > 400.0
                        {
                            Alert.unrealistic(on: self, message: "Height")
                        }
                        else
                        {
                           if weightToInt! < 1 || weightToInt! > 300
                           {
                               Alert.unrealistic(on: self, message: "Weight")
                           }
                           else
                           {
                               if ageToInt! < 1 || ageToInt! > 120
                               {
                                   Alert.unrealistic(on: self, message: "Age")
                               }
                               else
                               {
                                   if paToInt == 1.0 || paToInt == 1.27 || paToInt == 1.14 || paToInt == 1.12 || paToInt == 1.54 || paToInt == 1.45
                                   {
                                    if heightText.text!.contains(".")
                                    {
                                        calcualte()
                                    }
                                    else
                                    {
                                        heightToInt = heightToInt! / 100
                                        calcualte()
                                    }

                                   }
                                   else
                                   {
                                       Alert.pickerOption(on: self)
                                   }
                               }
                           }
                        }
                    }
                    else
                    {
                        Alert.numeric(on: self, error: "Age")
                    }
                }
                else
                {
                    Alert.numeric(on: self, error: "Weight")
                }
            }
            else
            {
                Alert.numeric(on: self, error: "Height")
            }
        }
        else
        {
            Alert.emptyField(on: self)
        }
    }
    
    @IBAction func btnLogout(_ sender: Any)
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let loginNavController = storyboard.instantiateViewController(identifier: "LoginNavigationController")
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(loginNavController)
        history.removeAll()
    }
    func calcualte()
    {
        globalPerson.weight = weightToInt!
        globalPerson.height = heightToInt!
        globalPerson.Age = ageToInt!
        globalPerson.PA = paToInt!
        if gender.selectedSegmentIndex == 0
        {
            globalPerson.gender = 0
            performSegue(withIdentifier: "calorie", sender: nil)
        }
        else if gender.selectedSegmentIndex == 1
        {
            globalPerson.gender = 1
            performSegue(withIdentifier: "calorie", sender: nil)
        }
    }
}
extension CalorieViewController:UIPickerViewDelegate, UIPickerViewDataSource
{
    func numberOfComponents(in pickerView: UIPickerView) -> Int
       {
            switch pickerView.tag {
            case 1:
                return numberOfComponents
            case 2:
                return 1
            case 3:
                return 1
            case 4:
                return 1
            default:
                return 1
            }
           
       }
       
       func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
       {
           switch pickerView.tag {
           case 1:
                if component == 0
               {
                   return meter.count
               }
               else if component == 2
               {
                   return center.count
               }
               else
               {
                   return 1
               }
           case 2:
               return weightArray.count
           case 3:
               return ageArray.count
           case 4:
               return paDisplay.count
           default:
               return 1
           }
       }
       
       func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
       {
           switch pickerView.tag {
           case 1:
                if component == 0
               {
                   return "\(meter[row])"
               }
               else if component == 1
               {
                   return "M"
               }else if component == 2
               {
                   return "\(center[row])"
               }
               else
               {
                   return "CM"
               }
           case 2:
               return String(weightArray[row])
           case 3:
               return String(ageArray[row])
           case 4:
               return paDisplay[row]
           default:
               return "Unable to find data"
           }
           
       }
       
       
       
       func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
       {
       switch pickerView.tag {
           case 1:
               let meterIndex = pickerView.selectedRow(inComponent: 0)
               let centerIndex = pickerView.selectedRow(inComponent: 2)
               heightText.text = "\(meter[meterIndex]).\(center[centerIndex])"
           case 2:
               weightText.text = String(weightArray[row])
               weightText.resignFirstResponder()
           case 3:
               ageText.text = String(ageArray[row])
               ageText.resignFirstResponder()
           case 4:
               paText.text = String(paArray[row])
               paText.resignFirstResponder()
           default:
               return
           }
       }
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView
    {
        var label:UILabel
        if let view = view as? UILabel
        {
            label = view
        }
        else
        {
            label = UILabel()
        }
        label.textColor = .white
        label.font = UIFont(name: "Menio-Regular", size: 17.0)
        label.textAlignment = .center

        switch pickerView.tag {
            case 1:
                if component == 0
                {
                    label.text = "\(meter[row])"
                }
                else if component == 1
                {
                    label.text = "M"
                }else if component == 2
                {
                    label.text = "\(center[row])"
                }
                else
                {
                    label.text = "CM"
                }
                return label
            case 2:
                label.text = "\(weightArray[row])"
                return label
            case 3:
                label.text = "\(ageArray[row])"
                return label
            case 4:
                label.text = "\(paDisplay[row])"
                return label
            default:
                return label
        }
    }
}
