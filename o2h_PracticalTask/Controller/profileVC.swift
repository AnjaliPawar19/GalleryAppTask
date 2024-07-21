//
//  profileVC.swift
//  o2h_PracticalTask
//
//  Created by Anjali Pawar on 21/07/24.
//

import UIKit

class profileVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    //MARK: Outlet
    @IBOutlet weak var didTapChangeProfile: UIButton!
    @IBOutlet weak var btnSave: UIButton!
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPass: UITextField!
    @IBOutlet weak var txtPhoneNumber: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var imgProfile: UIImageView!
    
    //MARK: Viewcontroller Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

//MARK: Button Click Event
extension profileVC {
    
    @IBAction func didTapSave(_ sender: UIButton) {
        validation()
    }
    
    @IBAction func didTapEditProfile(_ sender: UIButton) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func didTapBack(_ sender: UIButton) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
}

//MARK: UIImagePickerControllerDelegate Methods
extension profileVC {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let editedImage = info[.editedImage] as? UIImage {
            imgProfile.image = editedImage
        } else if let originalImage = info[.originalImage] as? UIImage {
            imgProfile.image = originalImage
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}

//MARK: Private Helper Method
extension profileVC {
    
    func validation(){
        
        let strUsername = txtUsername.text?.trim() ?? ""
        let strEmail = txtEmail.text?.trim() ?? ""
        let strPhoneNo = txtPhoneNumber.text?.trim() ?? ""
        let strPass = txtPass.text?.trim() ?? ""
        
        if strUsername.isEmpty {
            UtilityAlert.displayAlert(title: Constant.ValidationMessage.alertTitle, message: Constant.ValidationMessage.emptyUsername, from: self, completionHandler: nil)
        } else if strEmail.isEmpty {
            UtilityAlert.displayAlert(title: Constant.ValidationMessage.alertTitle, message: Constant.ValidationMessage.emptyEmail, from: self, completionHandler: nil)
        } else if !strEmail.isValidEmail() {
            UtilityAlert.displayAlert(title: Constant.ValidationMessage.alertTitle, message: Constant.ValidationMessage.validEmail, from: self, completionHandler: nil)
        } else if strPhoneNo.isEmpty {
            UtilityAlert.displayAlert(title: Constant.ValidationMessage.alertTitle, message: Constant.ValidationMessage.emptyPhone, from: self, completionHandler: nil)
        } else if !strPhoneNo.isValidPhone() {
            UtilityAlert.displayAlert(title: Constant.ValidationMessage.alertTitle, message: Constant.ValidationMessage.validPhone, from: self, completionHandler: nil)
        } else if strPass.isEmpty {
            UtilityAlert.displayAlert(title: Constant.ValidationMessage.alertTitle, message: Constant.ValidationMessage.emptyPass, from: self, completionHandler: nil)
        } else if !strPass.isValidPassword() {
            UtilityAlert.displayAlert(title: Constant.ValidationMessage.alertTitle, message: Constant.ValidationMessage.validPass, from: self, completionHandler: nil)
        } else {
            redirectToNextView(vcIdentifier: "ViewController")
        }
    }
}
