//
//  PopUpView.swift
//  TestingExpensesApp
//
//  Created by Lluis Martinez on 17/03/2021.
//

import Foundation
import UIKit

class PopUpView: UIView {
    let rootStackView: UIStackView = {
        let rootStackView = UIStackView()
        rootStackView.axis = .vertical
        rootStackView.distribution = .fill
        rootStackView.alignment = .fill
        rootStackView.translatesAutoresizingMaskIntoConstraints = false
        return rootStackView
    } ()
    
    let headerStackView: UIStackView = { return UIStackView() } ()
    let bodyStackView: UIStackView = { return UIStackView() } ()
    let buttonStackView: UIStackView = { return UIStackView() } ()
    
    var index: Int
    var numElements: Int
    
    override init(frame: CGRect) {
        index = 0
        numElements = 0
        
        super.init(frame: frame)
        self.addSubview(rootStackView)
        
        NSLayoutConstraint.activate([
            rootStackView.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            rootStackView.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor),
            rootStackView.heightAnchor.constraint(lessThanOrEqualTo: self.safeAreaLayoutGuide.heightAnchor),
            rootStackView.rightAnchor.constraint(equalTo: self.layoutMarginsGuide.rightAnchor), // Margins instead of safeAreaLyout --> system default by iOS
            rootStackView.leftAnchor.constraint(equalTo: self.layoutMarginsGuide.leftAnchor),
        ])
    }
    
    required init?(coder: NSCoder) { //put inside other constructor
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func addHeader(headerImageView: UIImageView? = nil, headerTitleLabel: UILabel? = nil, isHorizontal: Bool = false, spacing: CGFloat = 0){
        if(isHorizontal) {
            headerStackView.axis = .horizontal
        } else {
            headerStackView.axis = .vertical
        }
        
        headerStackView.distribution = .fill
        headerStackView.alignment = .fill
        headerStackView.translatesAutoresizingMaskIntoConstraints = false
        
        if let headerImageView = headerImageView {
            headerStackView.addArrangedSubview(headerImageView)
        }
        headerStackView.addSpace(size: spacing)
        if let headerTitleLabel = headerTitleLabel {
            headerStackView.addArrangedSubview(headerTitleLabel)
        }
        
        rootStackView.insertArrangedSubview(headerStackView, at: index)
        index += 1
        
    }
    
    func addBody(bodyPrimaryLabel: UILabel? = nil, bodySecondaryLabel: UILabel? = nil, marginSpacing: CGFloat = 0, spacing: CGFloat = 0) { // Need to set this flexible and have the possibility to add more labels inside the body
        bodyStackView.axis = .vertical
        bodyStackView.distribution = .fill
        bodyStackView.alignment = .fill
        bodyStackView.translatesAutoresizingMaskIntoConstraints = false
        //bodyDescriptionLabel.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 200), for: bodyStackView.axis)
        if let bodyPrimaryLabel = bodyPrimaryLabel {
            bodyStackView.addArrangedSubview(bodyPrimaryLabel)
        }
        bodyStackView.addSpace(size: spacing)
        if let bodySecondaryLabel = bodySecondaryLabel {
            bodyStackView.addArrangedSubview(bodySecondaryLabel)
        }
        
        
        rootStackView.insertArrangedSubview(bodyStackView, at: index)
        index += 1
        
        
        
        //bodyStackView.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 200), for: rootStackView.axis)
        NSLayoutConstraint.activate([
            bodyStackView.leftAnchor.constraint(equalTo: rootStackView.leftAnchor, constant: marginSpacing),
            bodyStackView.rightAnchor.constraint(equalTo: rootStackView.rightAnchor, constant: -marginSpacing),
        ])
        
        
    }
    
    func addButtons(primaryButton: MyButton? = nil, secondaryButton: MyButton? = nil, isHorizontal: Bool = false, spacing: CGFloat = 0) {
        if(isHorizontal) {
            buttonStackView.axis = .horizontal
        } else {
            buttonStackView.axis = .vertical
        }
        
        buttonStackView.distribution = .fillProportionally
        buttonStackView.alignment = .fill
        
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        
        if let button = primaryButton {
            buttonStackView.addArrangedSubview(button)
        }
        buttonStackView.addSpace(size: spacing)
        if let button = secondaryButton {
            buttonStackView.addArrangedSubview(button)
        }
        
        rootStackView.insertArrangedSubview(buttonStackView, at: index)
        index += 1
        
        /*
         NSLayoutConstraint.activate([
             buttonStackView.leftAnchor.constraint(equalTo: rootStackView.leftAnchor),
             buttonStackView.rightAnchor.constraint(equalTo: rootStackView.rightAnchor),
         ])*/
    }
    
    
    func setSpacing(_ spacings: [CGFloat]) {
        var i = 1
        for spacing in spacings {
            rootStackView.addSpace(size: spacing, at: i)
            i += 2
        }
    }
}


