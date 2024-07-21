//
//  LoginVC.swift
//  o2h_PracticalTask
//
//  Created by Anjali Pawar on 21/07/24.
//

import UIKit
import GoogleSignIn

class LoginVC: UIViewController {
    
    //MARK: Outlet
    @IBOutlet weak var btnGoogle: UIButton!
    
    //MARK: Viewcontroller Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Ensure the Google Sign-In button is visible when view appears
        btnGoogle.isHidden = false
    }
}

//MARK: Button Click Event
extension LoginVC {
    
    @IBAction func didTapGoogleSignIn(_ sender: UIButton) {
        GIDSignIn.sharedInstance.signIn(withPresenting: self) { signInResult, error in
            guard error == nil else {
                print("Error during sign-in: \(error!)")
                return
            }
            
            guard let signInResult = signInResult else { return }
            let user = signInResult.user

            // Handle user profile info if needed
            let emailAddress = user.profile?.email
            let fullName = user.profile?.name
            let familyName = user.profile?.familyName
            let profilePicUrl = user.profile?.imageURL(withDimension: 320)
            
            // Navigate to ViewController after successful sign-in
            self.performSegue(withIdentifier: "showMainVC", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMainVC" {
            // Prepare any data to pass to the next view controller if needed
        }
    }
}
