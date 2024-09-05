//
//  UIView.swift
//  StarRailXpress
//
//  Created by Paul Frank on 27/11/23.
//

import Foundation
import UIKit

extension UIViewController {
    func setupGradientBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [
            UIColor(named: "gradientOne")!.cgColor,
            UIColor(named: "gradientTwo")!.cgColor,
            UIColor(named: "gradientThree")!.cgColor
        ]
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
}
