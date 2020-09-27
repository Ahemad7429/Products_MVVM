//
//  ProgressIndicatorManager.swift
//  GreenAppexIOS
//
//  Created by AhemadAbbas on 26/09/20.
//  Copyright © 2020 AhemadAbbas. All rights reserved.
//

import Foundation
import SVProgressHUD

final class ProgressIndicatorManager {
    
    private init() {
        setDefaultproperty()
    }
    
    static let shared = ProgressIndicatorManager()
    
    private func setDefaultproperty(){
        SVProgressHUD.setDefaultStyle(.custom)
        SVProgressHUD.setDefaultMaskType(.custom)
    }
    
    func show(){
        SVProgressHUD.show()
    }
    
    func show(withStatus message:String){
        SVProgressHUD.show(withStatus: message)
    }
    
    func showSuccess(withStatus message:String){
        SVProgressHUD.showSuccess(withStatus: message)
    }
    
    func showError(withStatus message:String){
        SVProgressHUD.showError(withStatus: message)
    }
    
    func dismiss(){
        SVProgressHUD.dismiss()
    }
    
    func dismiss(with delay:TimeInterval){
        SVProgressHUD.dismiss(withDelay: delay)
    }
    
    func showProgressWith(progress: Double) {
        SVProgressHUD.showProgress(Float(progress), status: "Downloading...")
    }
    
}

extension UIViewController {
    
    func showHUD() {
        ProgressIndicatorManager.shared.show()
    }
    
    func dismissHUD(delay: Double) {
        ProgressIndicatorManager.shared.dismiss(with: delay)
    }
    
    func dismissHUD() {
        ProgressIndicatorManager.shared.dismiss()
    }
    
    func showSuccessHUD(message: String = "Success", dismissDelay: Double? = nil) {
        ProgressIndicatorManager.shared.showSuccess(withStatus: message)
        if let _ = dismissDelay {
            dismissHUD(delay: dismissDelay!)
        }
    }
    
    func showFailureHUD(message: String = "Fail") {
        ProgressIndicatorManager.shared.showError(withStatus: message)
    }
    
}
