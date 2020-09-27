//
//  DataProviderManager.swift
//  GreenAppexIOS
//
//  Created by AhemadAbbas on 26/09/20.
//  Copyright © 2020 AhemadAbbas. All rights reserved.
//

import UIKit

final class DataProviderManager {
    
    static let instance = DataProviderManager()
    let fileManger = FileManager.default
    private var userlist = UserDataModel()
    
    var cartProductsList = [CartProduct]()
    
    private init() {
        guard let mainUrl = Bundle.main.url(forResource: "product", withExtension: "json") else { return }
        do {
            let fileManger = FileManager.default
            let documentDirectory = try fileManger.url(for: .documentDirectory, in: .userDomainMask, appropriateFor:nil, create:false)
            let subUrl = documentDirectory.appendingPathComponent("product.json")
            loadFile(mainPath: mainUrl, subPath: subUrl)
        } catch {
            print(error)
        }
    }
    
    private func loadFile(mainPath: URL, subPath: URL){
        if fileManger.fileExists(atPath: subPath.path){
            decodeData(pathName: subPath)
            if userlist.userList?.isEmpty ?? false {
                decodeData(pathName: mainPath)
            }
        }else{
            decodeData(pathName: mainPath)
        }
    }
    
    private func decodeData(pathName: URL){
        do{
            let jsonData = try Data(contentsOf: pathName)
            let decoder = JSONDecoder()
            userlist = try decoder.decode(UserDataModel.self, from: jsonData)
        } catch {
            print(error)
        }
    }
    
    func getUserData() -> UserDataModel {
        return userlist
    }
}
