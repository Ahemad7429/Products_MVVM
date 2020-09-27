//
//  UserListDelegateExtension.swift
//  GreenAppexIOS
//
//  Created by AhemadAbbas on 26/09/20.
//  Copyright © 2020 AhemadAbbas. All rights reserved.
//

import UIKit
import MessageUI

extension UserListViewController: ProductCollectionViewDelegate {
    func addButtonWasTapped(product: Product) {
        showSuccessHUD(message: AppConst._PRODUCT_ADDED, dismissDelay: 0.5)
        viewModel.updateProduct(product: product)
        updateCartValue()
    }
}

extension UserListViewController: UserListTableViewDelegate {
    func emailButtonWasTapped(user: User) {
        sendEmail(user: user)
    }
    
    private func sendEmail(user: User) {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients([user.email ?? ""])
            mail.setSubject("subject of email")
            mail.setMessageBody("Here you can pass your body", isHTML: true)
            presentViewController(mail)
        } else {
            showAlert(errorMsg: "Cannot send mail")
        }
    }
    
}

extension UserListViewController: MFMailComposeViewControllerDelegate {
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        switch result {
        case MFMailComposeResult.cancelled:
            print("Cancelled")
        case MFMailComposeResult.saved:
            print("Saved")
        case MFMailComposeResult.sent:
            print("Sent")
        case MFMailComposeResult.failed:
            print("Error: \(error?.localizedDescription ?? "")")
        default:
            break
        }
        controller.dismissViewController()
    }
    
}
