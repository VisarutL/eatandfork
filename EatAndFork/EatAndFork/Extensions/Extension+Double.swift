//
//  Extension+Double.swift
//  EatAndFork
//
//  Created by Visarut on 7/7/2566 BE.
//

import Foundation

extension Double {
    func roundToTwoDecimal() -> String {
        return String(format: "%.2f", self)
    }
}
