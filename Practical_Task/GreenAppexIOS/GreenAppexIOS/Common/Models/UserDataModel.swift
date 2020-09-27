//
//  UserDataModel.swift
//  GreenAppexIOS
//
//  Created by AhemadAbbas on 26/09/20.
//  Copyright © 2020 AhemadAbbas. All rights reserved.
//

import Foundation

// MARK: - UserDataModel
struct UserDataModel: Codable {
    var userList: [User]?

    enum CodingKeys: String, CodingKey {
        case userList = "data"
    }
}

// MARK: - User
struct User: Codable {
    var fName: String?
    var lName: String?
    var email: String?
    var birthdate: String?
    var isActive: Bool?
    var product: [Product]?

    enum CodingKeys: String, CodingKey {
        case fName = "fName"
        case lName = "lName"
        case email = "email"
        case birthdate = "birthdate"
        case isActive = "isActive"
        case product = "product"
    }
}

// MARK: - Product
struct Product: Codable {
    var name: String?
    var price: String?
    var discount: String?

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case price = "price"
        case discount = "discount"
    }
}
