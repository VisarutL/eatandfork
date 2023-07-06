//
//  Extension+UIView.swift
//  EatAndFork
//
//  Created by Visarut on 5/7/2566 BE.
//

import UIKit

extension UIView {
    func loadNib() {
        let nibName = type(of: self).description().components(separatedBy: ".").last!
        Bundle.main.loadNibNamed(nibName, owner: self, options: nil)
    }
    
    func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius

        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
      }
}
