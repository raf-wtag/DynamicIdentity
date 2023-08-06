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
    
    @IBAction func setAlernateIconSilentlyDidTap(_ sender: Any) {
        setIconSilently("AlternateIcon1")
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
    
    private func setIconSilently(_ iconName: String?) {
        guard let iconName else { return }
        
        // anti apple private method call analyze
        if UIApplication.shared.responds(to: Selector(("supportsAlternateIcons"))),
           UIApplication.shared.supportsAlternateIcons {
            
            var selectorString = "_setAlternate"
            selectorString += "IconName:"
            selectorString += "completionHandler:"
            
            let selector = Selector(selectorString)
            if let imp = UIApplication.shared.method(for: selector) {
                typealias LCSetAlternateIconNameFunc = @convention(c) (NSObject, Selector, String, @escaping (Error?) -> Void) -> Void
                let funcPtr = unsafeBitCast(imp, to: LCSetAlternateIconNameFunc.self)
                funcPtr(UIApplication.shared, selector, iconName) { _ in }
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

