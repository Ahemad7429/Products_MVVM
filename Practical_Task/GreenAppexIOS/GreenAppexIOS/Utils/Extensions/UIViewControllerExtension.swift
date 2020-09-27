//
//  UIViewControllerExtension.swift
//  GreenAppexIOS
//
//  Created by AhemadAbbas on 26/09/20.
//  Copyright © 2020 AhemadAbbas. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    class var storyboardID: String {
        return "\(self)"
    }
    
    static func instantiateFrom(appStoryboard: AppStoryboard) -> Self {
        return appStoryboard.viewController(viewControllerClass: self)
    }
    
    func pushViewController(_ controller: UIViewController) {
        navigationController?.pushViewController(controller, animated: true)
    }
    
    func popViewController() {
        navigationController?.popViewController(animated: true)
    }
    
    func presentViewController(_ controller: UIViewController) {
        present(controller, animated: true, completion: nil)
    }
    
    func dismissViewController() {
        dismiss(animated: true, completion: nil)
    }
    
    func showAlert(errorMsg: String, title: String = "Error", buttonTitle: String = "Okay", completion: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: errorMsg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: buttonTitle, style: .default, handler: { (action) in
            alert.dismiss(animated: true, completion: completion)
        }))
        presentViewController(alert)
    }
    
    func showConfirmationAlert(message: String?, title: String?, firstButtonTitle: String?, secondButtonTitle: String?, firstCompletion: (() -> Void)?, secondCompletion: (() -> Void)?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: firstButtonTitle, style: .default, handler: { (action) in
            firstCompletion?()
        }))
        alert.addAction(UIAlertAction(title: secondButtonTitle, style: .default, handler: { (action) in
            secondCompletion?()
        }))
        presentViewController(alert)
    }
    
}
