//
//  CartDetailsViewModel.swift
//  GreenAppexIOS
//
//  Created by AhemadAbbas on 26/09/20.
//  Copyright © 2020 AhemadAbbas. All rights reserved.
//

import Foundation

class CartDetailsViewModel {
    
    func getCartProductsList() -> [CartProduct] {
        return DataProviderManager.instance.cartProductsList
    }
    
    func getTotalAmountAndDiscount() -> (amount: Int, discount: Int, total: Int) {
        var totalAmmountCount = 0
        var totalDiscountCount = 0
        self.getCartProductsList().forEach { (cartProduct) in
            totalAmmountCount += (Int(cartProduct.products?.first?.price ?? "0") ?? 0) * (cartProduct.products?.count ?? 0)
            totalDiscountCount += (Int(cartProduct.products?.first?.discount ?? "0") ?? 0) * (cartProduct.products?.count ?? 0)
        }
        return (totalAmmountCount, totalDiscountCount, totalAmmountCount - totalDiscountCount)
    }
    
    func removeProduct(at index: Int) {
        DataProviderManager.instance.cartProductsList.remove(at: index)
    }
}
