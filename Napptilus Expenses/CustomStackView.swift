//
//  CustomStackView.swift
//  TestingExpensesApp
//
//  Created by Lluis Martinez on 16/03/2021.
//

import Foundation
import UIKit

extension UIStackView {
    func addSpace(size: CGFloat, at: Int? = nil) {
        let view = UIView()
        view.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 0), for: axis)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.clear
        
        if let pos = at {
            self.insertArrangedSubview(view, at: pos)
        } else {
            self.addArrangedSubview(view)
        }
        
        
        switch axis {
        case .horizontal:
            view.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
            let w = view.widthAnchor.constraint(equalToConstant: size)
            w.priority = .defaultLow
            w.isActive = true
            break
        case .vertical:
            view.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
            let h = view.heightAnchor.constraint(equalToConstant: size)
            h.priority = .defaultLow
            h.isActive = true
            break
        default:
            break
        }
    }
    
    
    func removeAllArrangedSubviews() {
        let removedSubviews = arrangedSubviews.reduce([]) { (allSubviews, subview) -> [UIView] in
            self.removeArrangedSubview(subview)
            return allSubviews + [subview]
        }
          /*
        // Deactivate all constraints
        NSLayoutConstraint.deactivate(removedSubviews.flatMap({ $0.constraints }))
            */
        // Remove the views from self
        removedSubviews.forEach({ $0.removeFromSuperview() })
    }
}
