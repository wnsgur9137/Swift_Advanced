//
//  Type.swift
//  Translate
//
//  Created by 이준혁 on 2023/01/09.
//

import UIKit

enum `Type` {
    case source
    case target
    
    var color: UIColor {
        switch self {
        case .source: return .label
        case .target: return UIColor.mainTintColor
        }
    }
}
