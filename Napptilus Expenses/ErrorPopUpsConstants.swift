//
//  ErrorPopUpsConsts.swift
//  Napptilus Expenses
//
//  Created by Lluis Martinez on 05/03/2021.
//

import Foundation
import UIKit

public enum ErrorPopUpsConstants {
    
    static let title: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textAlignment = .center
        title.font = UIFont(name: "Helvetica-Bold", size: 18)
        title.textColor = UIColor.red
        return title
    }()
    
    static let description: UILabel = {
        let description = UILabel()
        description.translatesAutoresizingMaskIntoConstraints = false
        description.textAlignment = .center
        description.font = UIFont(name: "Helvetica", size: 16)
        description.textColor = UIColor.white
        return description
    }()
    
    static let buttonPrimaryColor: UIColor = UIColor(red: 0.0, green: 0.81, blue: 1.0, alpha: 1.0)
    static let buttonSecondaryColor: UIColor = UIColor(red: 0.0, green: 0.56, blue: 0.78, alpha: 1.0)
    static let buttonHeight: CGFloat = 56
    
    static let primaryButton: UIButton = {
        let primaryButton = UIButton(type: .system)
        primaryButton.translatesAutoresizingMaskIntoConstraints = false
        primaryButton.setTitleColor(.white, for: .normal)
        primaryButton.titleLabel?.font = UIFont(name: "Helvetica-Bold", size: 15)
        primaryButton.layer.cornerRadius = 28
        primaryButton.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
        return primaryButton
    }()
    
    static let secondaryButton: UIButton = {
        let secondaryButton = UIButton(type: .system)
        secondaryButton.translatesAutoresizingMaskIntoConstraints = false
        secondaryButton.backgroundColor = UIColor.clear
        secondaryButton.setTitleColor(buttonPrimaryColor, for: .normal)
        secondaryButton.layer.borderWidth = 2.0
        secondaryButton.layer.borderColor = buttonPrimaryColor.cgColor
        secondaryButton.titleLabel?.font = UIFont(name: "Helvetica-Bold", size: 15)
        secondaryButton.layer.cornerRadius = 28
        secondaryButton.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
        return secondaryButton
    }()
}

