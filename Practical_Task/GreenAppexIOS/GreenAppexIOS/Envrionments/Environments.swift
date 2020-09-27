//
//  Environments.swift
//  GreenAppexIOS
//
//  Created by AhemadAbbas on 26/09/20.
//  Copyright © 2020 AhemadAbbas. All rights reserved.
//

import Foundation

enum Environment: String {
    
    case dev = "Development"
    case production = "Production"
    case stage = "Stage"
    case qa = "QA"
    
    var baseUrl: String {
        switch self {
        case .dev, .stage, .production, .qa: return ""
        }
    }

}
