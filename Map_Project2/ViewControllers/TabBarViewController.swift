//
//  TabBarViewController.swift
//  Map_Project2
//
//  Created by Shaun on 22/8/20.
//  Copyright © 2020 Shaun. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    var image1 : UIImageView!
    var image2 : UIImageView!
    var image3 : UIImageView!
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.delegate = self
        
        
        var swipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeGesture))
        swipe.numberOfTouchesRequired = 2
        swipe.direction = .left
        self.view.addGestureRecognizer(swipe)
        
        
        swipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeGesture))
        swipe.numberOfTouchesRequired = 2
        swipe.direction = .right
        self.view.addGestureRecognizer(swipe)
        
        
        var itemView = self.tabBar.subviews[0]
        self.image1 = itemView.subviews.first as? UIImageView
        self.image1.contentMode = .center
        
        
        itemView = self.tabBar.subviews[1]
        self.image2 = itemView.subviews.first as? UIImageView
        self.image2.contentMode = .center

        itemView = self.tabBar.subviews[2]
        self.image3 = itemView.subviews.first as? UIImageView
        self.image3.contentMode = .center
    }

    
    @objc private func swipeGesture(swipe: UISwipeGestureRecognizer)
    {
        switch swipe.direction
        {
            case .left:
                if selectedIndex > 0 {
                    self.selectedIndex = self.selectedIndex - 1
                }
                break
            case .right:
                if selectedIndex < 3 {
                    self.selectedIndex = self.selectedIndex + 1
                }
            break
            default:
            break
        }
    }
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem)
    {
        if item.tag == 1
        {
            self.image1.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            UIView.animate(withDuration: 0.5, animations: {
                self.image1.transform = .identity
                self.image1.transform = CGAffineTransform(translationX: -20, y: -20)
            })
        }
        else if item.tag == 2
        {
            self.image2.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            UIView.animate(withDuration: 0.5, animations: {
                self.image2.transform = .identity
                self.image2.transform = CGAffineTransform(rotationAngle: 360)
            })
        }
        else if item.tag == 3
        {
            self.image3.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            UIView.animate(withDuration: 0.5, animations: {
                self.image3.transform = .identity
                self.image3.transform = CGAffineTransform(translationX: 50, y: 50)
            })
        }
    }
}
extension TabBarViewController : UITabBarControllerDelegate
{
    func tabBarController(_ tabBarController: UITabBarController, animationControllerForTransitionFrom fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning?
    {
        return TabViewAnimation()
    }
}
class TabViewAnimation : NSObject, UIViewControllerAnimatedTransitioning
{
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval
    {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning)
    {
        guard let destination = transitionContext.view(forKey: .to) else {
            return
        }
        destination.transform = CGAffineTransform(translationX: 0, y: destination.frame.height)
        transitionContext.containerView.addSubview(destination)
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            destination.transform = .identity
        }, completion: {transitionContext.completeTransition($0)})
    }
}


