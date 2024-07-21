//
//  DetailViewController.swift
//  Cities
//
//  Created by Yasar on 30.01.2021.
//

import UIKit

class DetailViewController: UIViewController {
    
    var city: ImageData?
    
    // MARK: - Outlets
    @IBOutlet var cityImageView: UIImageView!

    // MARK: - ViewController Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let imgName = city?.imgName {
            cityImageView.image = UIImage(named: imgName)
        }
    }
}

// MARK: - Button Click Event
extension DetailViewController {
    
    @IBAction func didTapClose(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
