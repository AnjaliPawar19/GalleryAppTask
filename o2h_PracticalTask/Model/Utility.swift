//
//  Utility.swift
//  SecurePay
//
//  Created by Samcom on 15/02/24.
//

import Foundation
import UIKit


class UtilityAlert {

    //Alert with OK and Cancel Button
    static func displayAlert(title: String , message: String, from viewController: UIViewController, completionHandler: (() -> Void)?){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        viewController.present(alert, animated: true, completion: nil)
    }
}
