//
//  Constant.swift
//  RegistrationForm_APIDemo
//
//  Created by Samir Khatri on 05/03/24.
//

import Foundation


struct Constant {
    struct ValidationMessage {
        static let alertTitle = "Validation Error"
        static let emptyUsername = "Username cannot be empty."
        static let emptyEmail = "Email cannot be empty."
        static let validEmail = "Please enter a valid email address."
        static let emptyPhone = "Phone number cannot be empty."
        static let validPhone = "Please enter a valid phone number."
        static let emptyPass = "Password cannot be empty."
        static let validPass = "Password must be at least 8 characters long, contain at least one uppercase letter, one lowercase letter, one digit, and one special character."
    }
}
