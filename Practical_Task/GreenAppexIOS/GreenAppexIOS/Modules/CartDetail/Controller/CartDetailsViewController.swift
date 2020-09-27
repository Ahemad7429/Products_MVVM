//
//  CartDetailsViewController.swift
//  GreenAppexIOS
//
//  Created by AhemadAbbas on 26/09/20.
//  Copyright © 2020 AhemadAbbas. All rights reserved.
//

import UIKit

class CartDetailsViewController: UIViewController {
    
    // MARK:- Outlets
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var discountSwitch: UISwitch!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var discountLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var noDataAvailableLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    // MARK:- Varialbes
    
    var viewModel = CartDetailsViewModel()
    var hasDiscount = true
    
    // MARK:- View Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
    // MARK:- Actions
    
    @IBAction func discoundSwitch(_ sender: Any) {
        hasDiscount.toggle()
        configureCalculationAndShow()
    }
    
    // MARK:- Functions
    
    func initialSetup() {
        self.title = AppConst.NavTitles.CART_DETAILS
        registerCell()
        configureCalculationAndShow()
    }
    
    func configureVisibilityOfProductList() {
        containerView.isHidden = !(viewModel.getCartProductsList().count > 0)
        noDataAvailableLabel.isHidden = !(viewModel.getCartProductsList().count == 0)
    }
    
    private func registerCell() {
        tableView.register(ProductTableViewCell.self)
    }
    
    func configureCalculationAndShow() {
        let totalAmmountCount = viewModel.getTotalAmountAndDiscount().amount
        let totalDiscountCount = viewModel.getTotalAmountAndDiscount().discount
        self.amountLabel.text = "\(AppConst._AMOUNT) $\(totalAmmountCount)"
        self.discountLabel.text = "\(AppConst._DISCOUNT) $\(totalDiscountCount)"
        self.discountLabel.isHidden = !hasDiscount
        self.totalLabel.text = "\(AppConst._TOTAL) $\(hasDiscount ? (viewModel.getTotalAmountAndDiscount().total) : totalAmmountCount)"
        configureVisibilityOfProductList()
    }

}
