//
//  UserListTableViewExtension.swift
//  GreenAppexIOS
//
//  Created by AhemadAbbas on 26/09/20.
//  Copyright © 2020 AhemadAbbas. All rights reserved.
//

import UIKit

extension UserListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.userData?.userList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let userCell = tableView.dequeueReusableCell(withIdentifier: UserListTableViewCell.reuseIdentifier, for: indexPath) as? UserListTableViewCell else {
            return UITableViewCell()
        }
        if let userdata = viewModel.userData?.userList?[indexPath.row] {
            userCell.delegate = self
            userCell.userDetails = userdata
        }
        return userCell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let userCell = cell as? UserListTableViewCell else { return }
        userCell.productCollectionView.register(ProductCollectionViewCell.self)
        userCell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
    }

}

