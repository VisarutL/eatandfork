//
//  Extension+UIColor.swift
//  EatAndFork
//
//  Created by Visarut on 5/7/2566 BE.
//

import UIKit

enum AssetsColor {
    case main
    case text
    case placeholder
    case background
}

extension UIColor {
    static func appColor(_ name: AssetsColor) -> UIColor? {
        switch name {
        case .main:
            return UIColor(named: "mainColor")
        case .text:
            return UIColor(named: "textColor")
        case .placeholder:
            return UIColor(named: "placeholderColor")
        case .background:
            return UIColor(named: "backgroundColor")
        }
    }
}
