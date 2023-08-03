//
//  HomeViewController.swift
//  DynamicIdentity
//
//  Created by Fahim Rahman on 1/8/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet var currentAppIconName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentAppIconName.text = UIApplication.shared.alternateIconName
    }
    
    
    @IBAction func setPrimaryIconDidTap(_ sender: Any) {
        setIcon(nil)
    }
    
    @IBAction func setAlternateIcon1DidTap(_ sender: Any) {
        setIcon("AlternateIcon1")
    }
    
    private func setIcon(_ title: String?) {
        UIApplication.shared.setAlternateIconName(title) { error in
            if let error {
                self.displayErrorAlert(with: error.localizedDescription)
            } else {
                print("System will display an alert")
            }
        }
    }
    
    private func displayErrorAlert(with errorMessage: String) {
        let alert = UIAlertController(title: "Icon Update Failed", message: errorMessage, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Okay", style: .default, handler: nil)
        alert.addAction(cancelAction)
        self.present(alert, animated: false)
    }
}

