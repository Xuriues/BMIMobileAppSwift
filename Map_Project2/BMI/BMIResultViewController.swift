//
//  BMIResultViewController.swift
//  Map_Project2
//
//  Created by Shaun on 7/8/20.
//  Copyright © 2020 Shaun. All rights reserved.
//

import UIKit

class BMIResultViewController: UIViewController {


    @IBOutlet weak var bmiLabel: UILabel!
    let backgroundImageView = UIImageView()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        backGround()
        let BMI = globalPerson.calculateBMI(sliderval: globalPerson.weight, textval: globalPerson.height)
        let temp = String(format: "%.1f", BMI)
        history.append("BMI:\(temp)")
        if BMI < 18.5
        {
            bmiLabel.text =  "\(temp) Underweight"
            backgroundImageView.backgroundColor = UIColor.bmiBlue
        }
        else if BMI < 25
        {
            bmiLabel.text = "\(temp) Average"
            backgroundImageView.backgroundColor = UIColor.bmiGreen
        }
        else if BMI < 30
        {
            bmiLabel.text = "\(temp) Overweight"
            backgroundImageView.backgroundColor = UIColor.bmiOrange
        }
        else if BMI < 35
        {
            bmiLabel.text = "\(temp) Obese 1"
            backgroundImageView.backgroundColor = UIColor.bmiRed
        }
        else if BMI < 40
        {
            bmiLabel.text = "\(temp) Obese 2"
            backgroundImageView.backgroundColor = UIColor.bmiRed
        }
        else
        {
            bmiLabel.text = "\(temp) Obese 3"
            backgroundImageView.backgroundColor = UIColor.bmiRed
          }
    }

    @IBAction func backToBMI(_ sender: Any)
    {
        UIView.animate(withDuration: 1.0, delay: 0.0, options: UIView.AnimationOptions.curveEaseIn, animations: {
           
            let transition: CATransition = CATransition()
            transition.duration = 0.5
            transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
            transition.type = CATransitionType.reveal
            transition.subtype = CATransitionSubtype.fromTop
            self.view.window!.layer.add(transition, forKey: nil)
            self.dismiss(animated: false, completion: nil)

            self.view.layer.add(transition, forKey: kCATransition)
            self.dismiss(animated: false, completion: nil)
            }, completion: nil)
    }
    func backGround()
    {
        view.addSubview(backgroundImageView)
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        backgroundImageView.image = UIImage(named: "bgColorCrop")
        view.sendSubviewToBack(backgroundImageView)
    }
}
