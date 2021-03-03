//
//  GradientButton.swift
//  Napptilus Expenses
//
//  Created by Lluis Martinez on 26/02/2021.
//

import Foundation
import UIKit

@IBDesignable
class GradientButton: UIButton {
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }

    private lazy var gradientLayer: CAGradientLayer = {
        let l = CAGradientLayer()
        l.frame = self.bounds
        l.colors = [UIColor(red: 0.0, green: 0.62, blue: 0.78, alpha: 1.0), UIColor(red: 0.0, green: 0.81, blue: 1.0, alpha: 1.0)]
        l.startPoint = CGPoint(x: 0, y: 0.5)
        l.endPoint = CGPoint(x: 1, y: 0.5)
        l.cornerRadius = 16
        layer.insertSublayer(l, at: 0)
        return l
    }()
}
