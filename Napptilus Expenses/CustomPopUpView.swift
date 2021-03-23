//
//  CustomPopUpView.swift
//  Napptilus Expenses
//
//  Created by Lluis Martinez on 23/03/2021.
//

import Foundation
import UIKit

extension PopUpView {
    
    public enum SuccessConstants {
        static let headerTitleFont: UIFont? = UIFont(name: "Helvetica-Bold", size: 18)
        static let headerTitleColor: UIColor = UIColor(red: 0.0, green: 0.78, blue: 1.0, alpha: 1.0)
        
        static let descriptionPrimaryLabelFont: UIFont? = UIFont(name: "Helvetica", size: 16)
        static let descriptionPrimaryLabelColor: UIColor = UIColor.white
        
        static let descriptionSecondaryLabelFont: UIFont? = UIFont(name: "HelveticaNeue-UltraLightItalic", size: 14)
        static let descriptionSecondaryLabelColor: UIColor = UIColor.white
        
        static let buttonTextFont: UIFont? = UIFont(name: "Helvetica-Bold", size: 15)
        static let buttonPrimaryTextColor: UIColor = UIColor.white
        static let buttonSecondaryTextColor: UIColor = UIColor(red: 0.0, green: 0.78, blue: 1.0, alpha: 1.0)
        static let buttonPrimaryColor: UIColor = UIColor(red: 0.0, green: 0.81, blue: 1.0, alpha: 1.0)
        static let buttonSecondaryColor: UIColor = UIColor(red: 0.0, green: 0.56, blue: 0.78, alpha: 1.0)
        static let buttonSecondaryBorderWidth: CGFloat = 2.0
        static let buttonSecondaryBorderColor: CGColor = UIColor(red: 0.0, green: 0.78, blue: 1.0, alpha: 1.0).cgColor
        
        static let buttonHeight: CGFloat = 56
        static let buttonRadius: CGFloat = 28
        
        static func getHeaderTitle(text: String) -> UILabel {
            let label = UILabel()
            label.textAlignment = .center
            label.font = headerTitleFont
            label.textColor = headerTitleColor
            label.text = text
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }
        
        static func getDescriptionPrimaryLabel(text: String) -> UILabel {
            let label = UILabel()
            label.textAlignment = .center
            label.font = descriptionPrimaryLabelFont
            label.textColor = descriptionPrimaryLabelColor
            label.text = text
            label.numberOfLines = 0
            label.lineBreakMode = .byWordWrapping
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }
        
        static func getDescriptionSecondaryLabel(text: String) -> UILabel {
            let label = UILabel()
            label.textAlignment = .center
            label.font = descriptionSecondaryLabelFont
            label.textColor = descriptionSecondaryLabelColor
            label.text = text
            label.numberOfLines = 0
            label.lineBreakMode = .byWordWrapping
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }
        
        static func getPrimaryButton(text: String) -> MyButton {
            let btn = MyButton()
            btn.applyGradient(colors: [buttonSecondaryColor.cgColor, buttonPrimaryColor.cgColor])
            btn.cornerRadius = buttonRadius
            btn.translatesAutoresizingMaskIntoConstraints = false
            btn.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
            
            let btnLabel = btn.addText(text: text)
            btnLabel.font = buttonTextFont
            btnLabel.textColor = buttonPrimaryTextColor
            
            return btn
        }
        
        static func getSecondaryButton(text: String) -> MyButton {
            let btn = MyButton()
            btn.backgroundColor = UIColor.clear
            btn.layer.borderWidth = buttonSecondaryBorderWidth
            btn.layer.borderColor = buttonSecondaryBorderColor
            btn.cornerRadius = buttonRadius
            btn.translatesAutoresizingMaskIntoConstraints = false
            btn.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
            
            let btnLabel = btn.addText(text: text)
            btnLabel.font = buttonTextFont
            btnLabel.textColor = buttonSecondaryTextColor
            
            return btn
        }
    }
    
    public enum ErrorConstants {
        static let headerTitleFont: UIFont? = UIFont(name: "Helvetica-Bold", size: 18)
        static let headerTitleColor: UIColor = UIColor.red
        
        static let descriptionPrimaryLabelFont: UIFont? = UIFont(name: "Helvetica", size: 16)
        static let descriptionPrimaryLabelColor: UIColor = UIColor.white
        
        static let descriptionSecondaryLabelFont: UIFont? = UIFont(name: "HelveticaNeue-UltraLightItalic", size: 14)
        static let descriptionSecondaryLabelColor: UIColor = UIColor.white
        
        static let buttonTextFont: UIFont? = UIFont(name: "Helvetica-Bold", size: 15)
        static let buttonPrimaryTextColor: UIColor = UIColor.white
        static let buttonSecondaryTextColor: UIColor = UIColor(red: 0.0, green: 0.78, blue: 1.0, alpha: 1.0)
        static let buttonPrimaryColor: UIColor = UIColor(red: 0.0, green: 0.81, blue: 1.0, alpha: 1.0)
        static let buttonSecondaryColor: UIColor = UIColor(red: 0.0, green: 0.56, blue: 0.78, alpha: 1.0)
        static let buttonSecondaryBorderWidth: CGFloat = 2.0
        static let buttonSecondaryBorderColor: CGColor = UIColor(red: 0.0, green: 0.78, blue: 1.0, alpha: 1.0).cgColor
        
        static let buttonHeight: CGFloat = 56
        static let buttonRadius: CGFloat = 28
        
        static func getHeaderTitle(text: String) -> UILabel {
            let label = UILabel()
            label.textAlignment = .center
            label.font = headerTitleFont
            label.textColor = headerTitleColor
            label.text = text
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }
        
        static func getDescriptionPrimaryLabel(text: String) -> UILabel {
            let label = UILabel()
            label.textAlignment = .center
            label.font = descriptionPrimaryLabelFont
            label.textColor = descriptionPrimaryLabelColor
            label.text = text
            label.numberOfLines = 0
            label.lineBreakMode = .byWordWrapping
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }
        
        static func getDescriptionSecondaryLabel(text: String) -> UILabel {
            let label = UILabel()
            label.textAlignment = .center
            label.font = descriptionSecondaryLabelFont
            label.textColor = descriptionSecondaryLabelColor
            label.text = text
            label.numberOfLines = 0
            label.lineBreakMode = .byWordWrapping
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }
        
        static func getPrimaryButton(text: String) -> MyButton {
            let btn = MyButton()
            btn.applyGradient(colors: [buttonSecondaryColor.cgColor, buttonPrimaryColor.cgColor])
            btn.cornerRadius = buttonRadius
            btn.translatesAutoresizingMaskIntoConstraints = false
            btn.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
            
            let btnLabel = btn.addText(text: text)
            btnLabel.font = buttonTextFont
            btnLabel.textColor = buttonPrimaryTextColor
            
            return btn
        }
        
        static func getSecondaryButton(text: String) -> MyButton {
            let btn = MyButton()
            btn.backgroundColor = UIColor.clear
            btn.layer.borderWidth = buttonSecondaryBorderWidth
            btn.layer.borderColor = buttonSecondaryBorderColor
            btn.cornerRadius = buttonRadius
            btn.translatesAutoresizingMaskIntoConstraints = false
            btn.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
            
            let btnLabel = btn.addText(text: text)
            btnLabel.font = buttonTextFont
            btnLabel.textColor = buttonSecondaryTextColor
            
            return btn
        }
    }
    
    public enum FormularConstants {
        
    }
}
