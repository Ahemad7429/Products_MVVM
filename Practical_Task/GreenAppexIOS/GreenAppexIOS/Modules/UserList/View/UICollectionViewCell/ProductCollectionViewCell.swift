//
//  ProductCollectionViewCell.swift
//  GreenAppexIOS
//
//  Created by AhemadAbbas on 26/09/20.
//  Copyright © 2020 AhemadAbbas. All rights reserved.
//

import UIKit

protocol ProductCollectionViewDelegate: class {
    func addButtonWasTapped(product: Product)
}

class ProductCollectionViewCell: UICollectionViewCell, NibLoadableView, ReusableView {

    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var productDiscountLabel: UILabel!
    
    var delegate: ProductCollectionViewDelegate?
    
    var product: Product? {
        didSet {
            self.productNameLabel.text = product?.name
            self.productPriceLabel.text = "Price $\(product?.price ?? "0")"
            self.productDiscountLabel.text = "Discount $\(product?.discount ?? "0")"
        }
    }

    @IBAction func addButtonWasTapped(_ sender: Any) {
        if let product = product {
            delegate?.addButtonWasTapped(product: product)
        }
    }
    
}
