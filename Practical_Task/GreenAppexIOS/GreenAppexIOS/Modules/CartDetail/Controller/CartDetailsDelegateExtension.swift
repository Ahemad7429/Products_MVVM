//
//  CartDetailsDelegateExtension.swift
//  GreenAppexIOS
//
//  Created by AhemadAbbas on 27/09/20.
//  Copyright © 2020 AhemadAbbas. All rights reserved.
//

import Foundation

extension CartDetailsViewController: ProductTableViewCellDelegate {
    
    func addProduct(index: Int) {
        if let product = viewModel.getCartProductsList()[index].products?.first {
            viewModel.getCartProductsList()[index].products?.append(product)
            configureCalculationAndShow()
            tableView.reloadData()
        }
    }
    
    func removeProduct(index: Int) {
        if viewModel.getCartProductsList()[index].products?.count == 1 {
            self.showConfirmationAlert(message: AppConst.AlertMessages._REMOVE_PRODUCT_CART, title: nil, firstButtonTitle: AppConst.ButtonTitles.YES, secondButtonTitle: AppConst.ButtonTitles.NO, firstCompletion: {
                self.viewModel.removeProduct(at: index)
                DispatchQueue.main.async {
                    self.configureCalculationAndShow()
                    self.tableView.reloadData()
                }
            }, secondCompletion: nil)
        } else {
            viewModel.getCartProductsList()[index].products?.remove(at: 0)
            DispatchQueue.main.async {
                self.configureCalculationAndShow()
                self.tableView.reloadData()
            }
        }
    }
    
}

