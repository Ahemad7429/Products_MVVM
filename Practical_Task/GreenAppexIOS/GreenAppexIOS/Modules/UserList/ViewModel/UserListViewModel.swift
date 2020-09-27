//
//  UserListViewModel.swift
//  GreenAppexIOS
//
//  Created by AhemadAbbas on 26/09/20.
//  Copyright © 2020 AhemadAbbas. All rights reserved.
//

import Foundation

class UserListViewModel {
    
    var userData: UserDataModel?
    
    func getUserData(success: () -> Void, failure: (String) -> Void) {
        userData = DataProviderManager.instance.getUserData()
        if (userData?.userList?.count ?? 0) > 0 {
            success()
        } else {
            failure("Something Went Wrong")
        }
    }
    
    func getCartProductsCount() -> Int {
        var count = 0
        DataProviderManager.instance.cartProductsList.forEach { (carProducts) in
            count += (carProducts.products?.count ?? 0)
        }
        return count
    }
    
    func updateProduct(product: Product) {
        let currentProductID = "\(product.name ?? "")_\(product.discount ?? "")"
        let productIDs = DataProviderManager.instance.cartProductsList.map { (cartProducts) -> String in
            return cartProducts.id ?? ""
        }
        
        if let index = productIDs.firstIndex(where: { (id) -> Bool in
            return id == currentProductID
        }) {
            DataProviderManager.instance.cartProductsList[index].products?.append(product)
        } else {
            let cartProductObj = CartProduct()
            cartProductObj.id = currentProductID
            cartProductObj.products = [product]
            DataProviderManager.instance.cartProductsList.append(cartProductObj)
        }
    }
}
