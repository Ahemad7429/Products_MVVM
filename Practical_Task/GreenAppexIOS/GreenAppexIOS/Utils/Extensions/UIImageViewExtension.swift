//
//  UIImageViewExtension.swift
//  GreenAppexIOS
//
//  Created by AhemadAbbas on 26/09/20.
//  Copyright © 2020 AhemadAbbas. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
    
    func setImage(with urlString: String?, indicator: Bool = true, placeHolderImage: UIImage) {
        if indicator {
            self.kf.indicatorType = .activity
        }
        if let imageUrl = urlString, !imageUrl.isEmpty {
            self.kf.setImage(with: URL(string: imageUrl))
        } else {
            self.image = placeHolderImage
        }
    }
    
}
