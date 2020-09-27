//
//  UserListViewController.swift
//  GreenAppexIOS
//
//  Created by AhemadAbbas on 26/09/20.
//  Copyright © 2020 AhemadAbbas. All rights reserved.
//

import UIKit

class UserListViewController: UIViewController {
    
    // MARK:- Outlets
    
    @IBOutlet weak var userListTableView: UITableView!
    
    // MARK:- Variables
    
    let viewModel = UserListViewModel()
    var refreshControl = UIRefreshControl()
    
    
    // MARK:- Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initalSetup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateCartValue()
    }
    
    // MARK:- Functions
    
    func prepareNavButton() {
        dismissHUD()
    }
    
    func initalSetup() {
        userListTableView.register(UserListTableViewCell.self)
        refreshControl.tintColor = .white
        refreshControl.addTarget(self, action: #selector(refreshUsers), for: .valueChanged)
        userListTableView.refreshControl = refreshControl
        userListTableView.allowsMultipleSelectionDuringEditing = false
        requestForUserData()
    }
    
    func updateCartValue() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "CART (\(viewModel.getCartProductsCount()))", style: .plain, target: self, action: #selector(addTapped))
    }
    
    func requestForUserData() {
        showHUD()
        viewModel.getUserData(success: {
            dismissHUD()
            refreshControl.endRefreshing()
            DispatchQueue.main.async {
                self.userListTableView.reloadData()
            }
        }) { (errorMessage) in
            dismissHUD()
            showAlert(errorMsg: errorMessage)
        }
    }
    
    @objc private func refreshUsers() {
        viewModel.userData?.userList?.removeAll()
        userListTableView.reloadData()
        requestForUserData()
    }
    
    @objc func addTapped() {
        let cartDetailsVC = CartDetailsViewController.instantiateFrom(appStoryboard: .main)
        pushViewController(cartDetailsVC)
    }
    
}


