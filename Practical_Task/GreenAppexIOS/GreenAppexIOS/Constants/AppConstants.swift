//
//  AppConstants.swift
//  GreenAppexIOS
//
//  Created by AhemadAbbas on 26/09/20.
//  Copyright © 2020 AhemadAbbas. All rights reserved.
//

import Foundation

struct AppConst {
    
    static var currentConfiguration: Environment {
        var configuration = Configuration()
        return configuration.environment
    }
    
    struct AlertMessages {
        static let _REMOVE_PRODUCT_CART = "Are you sure you want to remove this product from cart?"
    }
    
    struct ButtonTitles {
        static let YES                  = "Yes"
        static let NO                   = "No"
    }
    
    struct NavTitles {
        static let CART_DETAILS         = "Cart Details"
    }
    
    static let _AMOUNT                  = "Amount:"
    static let _DISCOUNT                = "Discount:"
    static let _TOTAL                   = "Total:"
    static let _PRICE                   = "Price:"
    static let _PRODUCT_ADDED           = "Product Added"
}
