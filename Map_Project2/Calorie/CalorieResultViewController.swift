//
//  CalorieResultViewController.swift
//  Map_Project2
//
//  Created by Shaun on 7/8/20.
//  Copyright © 2020 Shaun. All rights reserved.
//

import UIKit

class CalorieResultViewController: UIViewController {

    let backgroundImageView = UIImageView()

    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var calorieLabel: UILabel!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        backGround()
        if globalPerson.gender == 0
        {
            let result =  Int(globalPerson.calculateCalorie(w: globalPerson.weight, h: globalPerson.height, age: globalPerson.Age, pa: globalPerson.PA,genderIndex: globalPerson.gender))
            backgroundImageView.backgroundColor = UIColor.maleColor
            calorieLabel.text = "\(result) calories daily"
            history.append("Calorie:\(Int(result))")
        }
        else if globalPerson.gender == 1
        {
            let result = Int(globalPerson.calculateCalorie(w: globalPerson.weight, h: globalPerson.height, age: globalPerson.Age, pa: globalPerson.PA,genderIndex: globalPerson.gender))
            backgroundImageView.backgroundColor = UIColor.femaleColor
            calorieLabel.text = "\(result) calories daily"
            history.append("Calorie:\(Int(result))")
        }
    }
    
    
    @IBAction func buttonBack(_ sender: Any)
    {
        UIView.animate(withDuration: 1.0, delay: 0.5, options: UIView.AnimationOptions.curveEaseIn, animations: {
           
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
        backgroundImageView.backgroundColor = UIColor.maleColor
        backgroundImageView.image = UIImage(named: "bgColorCrop")
        view.sendSubviewToBack(backgroundImageView)
    }
    
}
