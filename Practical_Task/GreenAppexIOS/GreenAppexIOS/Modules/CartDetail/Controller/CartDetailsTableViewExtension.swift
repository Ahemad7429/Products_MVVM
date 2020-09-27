//
//  CartDetailsTableViewExtension.swift
//  GreenAppexIOS
//
//  Created by AhemadAbbas on 27/09/20.
//  Copyright © 2020 AhemadAbbas. All rights reserved.
//

import UIKit

extension CartDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getCartProductsList().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let productCell = tableView.dequeueReusableCell(withIdentifier: ProductTableViewCell.reuseIdentifier, for: indexPath) as? ProductTableViewCell else {
            return UITableViewCell()
        }
        productCell.delegate = self
        productCell.index = indexPath.row
        productCell.cartProduct = viewModel.getCartProductsList()[indexPath.row]
        return productCell
    }
    
}
