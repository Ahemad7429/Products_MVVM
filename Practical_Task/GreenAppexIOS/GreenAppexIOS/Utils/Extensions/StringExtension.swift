//
//  StringExtension.swift
//  GreenAppexIOS
//
//  Created by AhemadAbbas on 27/09/20.
//  Copyright © 2020 AhemadAbbas. All rights reserved.
//

import Foundation


extension String {
    
    func convertToBDate() -> String {
        let timeInterval = Double(self) ?? 0
        let date = Date(timeIntervalSince1970: timeInterval)
        let dateFormatter = DateFormatter()
        dateFormatter.calendar = .current
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        return dateFormatter.string(from: date)
    }
    
}
