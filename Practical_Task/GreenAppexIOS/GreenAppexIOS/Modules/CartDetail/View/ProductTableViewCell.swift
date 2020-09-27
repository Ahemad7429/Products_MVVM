//
//  ProductTableViewCell.swift
//  GreenAppexIOS
//
//  Created by AhemadAbbas on 26/09/20.
//  Copyright © 2020 AhemadAbbas. All rights reserved.
//

import UIKit

protocol ProductTableViewCellDelegate: class {
    func addProduct(index: Int)
    func removeProduct(index: Int)
}

class ProductTableViewCell: UITableViewCell, NibLoadableView, ReusableView {
    
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var productDiscountLabel: UILabel!
    @IBOutlet weak var productCountLabel: UILabel!
    @IBOutlet weak var removeButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    
    var index: Int = 0
    
    var cartProduct: CartProduct? {
        didSet {
            self.productNameLabel.text = cartProduct?.products?.first?.name
            self.productPriceLabel.text = "\(AppConst._PRICE) $\(cartProduct?.products?.first?.price ?? "0")"
            self.productDiscountLabel.text = "\(AppConst._DISCOUNT) $\(cartProduct?.products?.first?.discount ?? "0")"
            self.productCountLabel.text = "\(cartProduct?.products?.count ?? 0)"
        }
    }
    
    weak var delegate: ProductTableViewCellDelegate?

    @IBAction func buttonWasTapped(_ sender: UIButton) {
        switch sender {
        case removeButton:
            delegate?.removeProduct(index: index)
        case addButton:
            delegate?.addProduct(index: index)
        default:
            break
        }
    }
}
