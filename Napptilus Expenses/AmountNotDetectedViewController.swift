//
//  ViewController.swift
//  Napptilus Expenses
//
//  Created by Lluis Martinez on 25/02/2021.
//

import UIKit


class AmountNotDetectedViewController: UIViewController {
    let popUpView: PopUpView = PopUpView()
    
    let headerImageView: UIImageView = {
        let headerImageView = UIImageView(image: UIImage(named: "ic_no_detected"))
        headerImageView.translatesAutoresizingMaskIntoConstraints = false
        headerImageView.contentMode = .scaleAspectFit
        return headerImageView
    } ()
    
    let errorTitle: UILabel = PopUpView.ErrorConstants.getHeaderTitle(text: "NO_AMOUNT_DETECTED_TITLE".localized)
    
    let errorDescription: UILabel = PopUpView.ErrorConstants.getDescriptionPrimaryLabel(text: "NO_AMOUNT_DETECTED_DESCRIPTION".localized)
    
    let manualImportButton: MyButton = PopUpView.ErrorConstants.getPrimaryButton(text: "NO_AMOUNT_DETECTED_MANUAL_IMPORT".localized)
    
    let newPhotoButton: MyButton = PopUpView.ErrorConstants.getSecondaryButton(text: "NO_AMOUNT_DETECTED_NEW_PHOTO".localized)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(popUpView)
        popUpView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.popUpView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.popUpView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            self.popUpView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            self.popUpView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
        self.popUpView.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.85)
        
        manualImportButton.addAction {
            self.dismiss(animated: true, completion:nil)
        }
        newPhotoButton.addAction {
            self.dismiss(animated: true, completion:nil)
        }
        
        popUpView.addHeader(headerImageView: headerImageView, headerTitleLabel: errorTitle, spacing: 16)
        popUpView.addBody(bodyPrimaryLabel: errorDescription, marginSpacing: 0) // 15
        popUpView.addButtons(primaryButton: manualImportButton, secondaryButton: newPhotoButton, spacing: 24)
        popUpView.setSpacing([9, 32])
    }
    

    @objc func buttonTapped() {
        dismiss(animated: true, completion: nil)
    }
}

