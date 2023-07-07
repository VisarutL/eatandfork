//
//  Extension+UIImage.swift
//  EatAndFork
//
//  Created by Visarut on 7/7/2566 BE.
//

import Foundation
import UIKit

extension UIImage {
    /// This method creates an image of a view
    convenience init?(view: UIView) {
        // Based on https://stackoverflow.com/a/41288197/1118398
        let renderer = UIGraphicsImageRenderer(bounds: view.bounds)
        let image = renderer.image { rendererContext in
            view.layer.render(in: rendererContext.cgContext)
        }

        if let cgImage = image.cgImage {
            self.init(cgImage: cgImage, scale: UIScreen.main.scale, orientation: .up)
        } else {
            return nil
        }
    }
}
