//
//  Design.swift
//  Map_Project2
//
//  Created by Shaun on 7/8/20.
//  Copyright © 2020 Shaun. All rights reserved.
//
import UIKit

extension UIViewController
{
    @IBAction func unwint(_ seque: UIStoryboardSegue) {}
    @IBAction func calorie(_ seque: UIStoryboardSegue) {}
}
@IBDesignable
    open class customUITextField: UITextField
    {
    open override func leftViewRect(forBounds bounds: CGRect) -> CGRect
    {
        var textRect = super.leftViewRect(forBounds: bounds)
        textRect.origin.x += leftPadding
        return textRect
    }

    @IBInspectable var leftImage: UIImage?
    {
        didSet
        {
            updateView()
        }
    }
    @IBInspectable var leftPadding: CGFloat = 0
        
    @IBInspectable var color: UIColor = UIColor.lightGray
    {
        didSet
        {
            updateView()
        }
    }

    func updateView()
    {
        if let image = leftImage
        {
            leftViewMode = UITextField.ViewMode.always
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
            imageView.contentMode = .scaleAspectFit
            imageView.image = image
            imageView.tintColor = color
            leftView = imageView
        } else
        {
            leftViewMode = UITextField.ViewMode.never
            leftView = nil
        }

        // Placeholder text color
        attributedPlaceholder = NSAttributedString(string: placeholder != nil ?  placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: color])
    }
    
    func setup()
    {
        let border = CALayer()
        let width = CGFloat(2.0)
        border.borderColor = UIColor.darkGray.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width: self.frame.size.width, height: self.frame.size.height)
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }

    override init(frame: CGRect)
    {
        super.init(frame: frame)
        setup()
    }
    required public init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        setup()
    }
}
extension UIColor
{
    static let maleColor = UIColor().colorFromHex("6F93FF")
    static let femaleColor = UIColor().colorFromHex("F5B5FF")
    static let bgColor = UIColor().colorFromHex("A798D8")
    static let tableColor = UIColor().colorFromHex("BEBEE6")
    static let darkbgColor = UIColor().colorFromHex("695481")
    static let darkFemale = UIColor().colorFromHex("CA74DD")
    static let darkMale = UIColor().colorFromHex("516CBC")
    static let tintMale = UIColor().colorFromHex("055CE2")
    static let tintFemale = UIColor().colorFromHex("E648DD")
    static let bmiGreen = UIColor().colorFromHex("8CEC86")
    static let bmiBlue = UIColor().colorFromHex("3175F2")
    static let bmiOrange = UIColor().colorFromHex("FFBB69")
    static let bmiRed = UIColor().colorFromHex("EB5D4F")
    func colorFromHex(_ hex:String ) -> UIColor
    {
        var hexString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if hexString.hasPrefix("#")
        {
            hexString.remove(at: hexString.startIndex)
        }
        if hexString.count != 6
        {
            return UIColor.black
        }
        var rgb : UInt32 = 0
        Scanner(string: hexString).scanHexInt32(&rgb)
        return UIColor.init(red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
                            green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
                            blue: CGFloat(rgb & 0x0000FF) / 255.0,
                            alpha: 1.0)
    }
}
