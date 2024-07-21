//
//  AppExtensions.swift
//  RegistrationForm_APIDemo
//
//  Created by Samir Khatri on 05/03/24.
//

import Foundation
import UIKit

extension String {

    // Validation for email
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }

    // Validation for phone number
    func isValidPhone() -> Bool {
        let phoneRegEx = "^[6-9]\\d{9}$"
        let phonePred = NSPredicate(format: "SELF MATCHES %@", phoneRegEx)
        return phonePred.evaluate(with: self)
    }

    // Validation for white space
    func trim() -> String {
        return self.trimmingCharacters(in: .whitespaces)
    }

    // Validation for password
    func isValidPassword() -> Bool {
        // At least one uppercase letter
        let uppercasePattern = ".*[A-Z]+.*"
        // At least one lowercase letter
        let lowercasePattern = ".*[a-z]+.*"
        // At least one digit
        let digitPattern = ".*[0-9]+.*"
        // At least one special character
        let specialCharacterPattern = ".*[!&^%$#@()/]+.*"
        // Minimum length 8 characters
        let minLength = 8

        let uppercasePred = NSPredicate(format: "SELF MATCHES %@", uppercasePattern)
        let lowercasePred = NSPredicate(format: "SELF MATCHES %@", lowercasePattern)
        let digitPred = NSPredicate(format: "SELF MATCHES %@", digitPattern)
        let specialCharacterPred = NSPredicate(format: "SELF MATCHES %@", specialCharacterPattern)

        return self.count >= minLength &&
               uppercasePred.evaluate(with: self) &&
               lowercasePred.evaluate(with: self) &&
               digitPred.evaluate(with: self) &&
               specialCharacterPred.evaluate(with: self)
    }
}


//MARK: - UIIViewController -
extension UIViewController {
    // Function for Navigation
    func redirectToNextView(vcIdentifier: String) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: vcIdentifier)
        navigationController?.pushViewController(vc, animated: true)
    }
}


//MARK: - Custome Extensions -
// Corner Radius
extension UIView {
    
    @IBInspectable var cornerRadiusV: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var borderWidthV: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColorV: UIColor? {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
}

@IBDesignable extension UIView {
    @IBInspectable var shadowColor: UIColor?{
        set {
            guard let uiColor = newValue else { return }
            layer.shadowColor = uiColor.cgColor
        }
        get{
            guard let color = layer.shadowColor else { return nil }
            return UIColor(cgColor: color)
        }
    }

    @IBInspectable var shadowOpacity: Float{
        set {
            layer.shadowOpacity = newValue
        }
        get{
            return layer.shadowOpacity
        }
    }

    @IBInspectable var shadowOffset: CGSize{
        set {
            layer.shadowOffset = newValue
        }
        get{
            return layer.shadowOffset
        }
    }

    @IBInspectable var shadowRadius: CGFloat{
        set {
            layer.shadowRadius = newValue
        }
        get{
            return layer.shadowRadius
        }
    }
}


