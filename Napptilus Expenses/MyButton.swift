//
//  CustomButton3.swift
//  TestingExpensesApp
//
//  Created by Lluis Martinez on 22/03/2021.
//

import Foundation
import UIKit

/*
public struct Configuration {
    func primaryButton(text: String? = nil) -> MyButton {
        let btn = MyButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.applyGradient(colors: [ErrorPopUpsConstants.buttonSecondaryColor.cgColor, ErrorPopUpsConstants.buttonPrimaryColor.cgColor])
        btn.cornerRadius = 28
        btn.heightAnchor.constraint(equalToConstant: ErrorPopUpsConstants.buttonHeight).isActive = true
        if let text = text {
            let label = btn.addText(text: text)
            label.font = UIFont(name: "Helvetica-Bold", size: 15)
            label.textColor = UIColor.white
        }
        return btn
    }
    
    func secondaryButton() -> MyButton {
        let btn = MyButton()
        
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.clear
        btn.layer.borderWidth = 2.0
        btn.cornerRadius = 28
        btn.heightAnchor.constraint(equalToConstant: ErrorPopUpsConstants.buttonHeight).isActive = true
        
        return btn
    }
    
    func roundButton(height: CGFloat) -> MyButton {
        let btn = MyButton()
        
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.cornerRadius = height/2
        NSLayoutConstraint.activate([
            btn.heightAnchor.constraint(equalToConstant: height),
            btn.widthAnchor.constraint(equalTo: btn.heightAnchor),
        ])
        
        return btn
    }
}
*/

class MyButton: UIStackView {
    // Use lambdas when button is pressed
    typealias BtAction = () -> ()
    private var actions: [BtAction] = []
    
    // Button elements
    let gradientLayer: CAGradientLayer
    
    // Index when inserting subviews
    var index: Int
    
    // To update gradient layer when size changes
    var cornerRadius: CGFloat {
        willSet(newCornerRadius) {
            self.layer.cornerRadius = newCornerRadius
            self.gradientLayer.cornerRadius = newCornerRadius
        }
    }
    override var bounds: CGRect {
        willSet(newBounds){
            gradientLayer.frame = newBounds
        }
    }

    // Initializers
    override init(frame: CGRect) {
        // Initialization of values
        self.gradientLayer = CAGradientLayer()
        self.cornerRadius = 0
        self.index = 0
        super.init(frame: frame)
        
        // Set up of StackView
        self.axis = .horizontal
        self.distribution = .fill
        self.alignment = .fill
        self.translatesAutoresizingMaskIntoConstraints = false
        
        // Set StackView to work as a button (set clickable)
        self.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(callAllActions))
        self.addGestureRecognizer(gestureRecognizer)
    }
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func applyGradient(colors: [CGColor]) {
        self.layoutIfNeeded()
        gradientLayer.colors = colors
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        gradientLayer.frame = self.bounds
        gradientLayer.cornerRadius = self.layer.cornerRadius
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    

    
    @discardableResult func addText(text: String, at: Int? = nil) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        if let pos = at {
            self.insertArrangedSubview(label, at: pos)
        } else {
            self.insertArrangedSubview(label, at: index)
        }
        index += 1
        return label
    }
    
    @discardableResult func addImage(imageName: String, at: Int? = nil) -> UIImageView {
        let imageView = UIImageView(image: UIImage(named: imageName))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        if let pos = at {
            self.insertArrangedSubview(imageView, at: pos)
        } else {
            self.insertArrangedSubview(imageView, at: index)
        }
        index += 1
        return imageView
    }
    
    func removeElement(_ view: UIView) {
        self.removeArrangedSubview(view)
        view.removeFromSuperview()
    }
    
    func setMargins(_ margins: [CGFloat]) {
        var i = 0
        for margin in margins {
            self.addSpace(size: margin, at: i)
            i += 2
        }
    }
    
    func removeMargins() {
        let views = self.arrangedSubviews
        var i = 0
        for view in views {
            if i%2 != 0 {
                i += 1
                continue
            }
            self.removeArrangedSubview(view)
            view.removeFromSuperview()
            i += 1
        }
    }
    
    
    // To work with lambda functions
    func addAction(action: @escaping BtAction){
        actions.append(action)
    }
    
    func clearActions(){
        actions.removeAll()
    }
    
    @objc private func callAllActions() {
        actions.forEach { (action) in
          action()
        }
    }
    
    
}
