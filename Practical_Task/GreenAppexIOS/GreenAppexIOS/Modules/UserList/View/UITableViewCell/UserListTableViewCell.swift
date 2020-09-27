//
//  UserListTableViewCell.swift
//  GreenAppexIOS
//
//  Created by AhemadAbbas on 26/09/20.
//  Copyright © 2020 AhemadAbbas. All rights reserved.
//

import UIKit

protocol UserListTableViewDelegate: class {
    func emailButtonWasTapped(user: User)
}

class UserListTableViewCell: UITableViewCell, NibLoadableView, ReusableView {
    
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var userProfileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userEmailLabel: UILabel!
    @IBOutlet weak var contactUserLabel: UILabel!
    @IBOutlet weak var userBdayLabel: UILabel!
    @IBOutlet weak var collectionContainer: UIView!
    @IBOutlet weak var productCollectionView: UICollectionView!
    
    var userDetails: User? {
        didSet {
            userNameLabel.text = userDetails?.fName
            userEmailLabel.text = userDetails?.email
            contactUserLabel.text = "+91 1234567890"
            userBdayLabel.text = userDetails?.birthdate?.convertToBDate()
            collectionContainer.isHidden = ((userDetails?.product?.count ?? 0) == 0)
            
        }
    }
    
    weak var delegate: UserListTableViewDelegate?
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setCollectionViewDataSourceDelegate(dataSourceDelegate: UICollectionViewDataSource & UICollectionViewDelegate, forRow row: Int) {
        productCollectionView.delegate = dataSourceDelegate
        productCollectionView.dataSource = dataSourceDelegate
        productCollectionView.tag = row
        productCollectionView.reloadData()
    }
    
    @IBAction func sendButtonWasTapped(_ sender: UIButton) {
        if let user =  self.userDetails {
            delegate?.emailButtonWasTapped(user: user)
        }
    }
    
}
