//
//  ViewController.swift
//  Napptilus Expenses
//
//  Created by Lluis Martinez on 25/02/2021.
//

import UIKit


class AmountNotDetectedViewController: UIViewController {
    let errorImageView: UIImageView = { // maybe lazy var
        let imageName = "ic_no_detected"
        let image = UIImage(named: imageName)
        let errorImageView = UIImageView(image: image!)
        errorImageView.translatesAutoresizingMaskIntoConstraints = false
        errorImageView.contentMode = .scaleAspectFit
        return errorImageView
    }()
    
    let errorTitle: UILabel = {
        let errorTitle = ErrorPopUpsConstants.title
        errorTitle.text = "NO_AMOUNT_DETECTED_TITLE".localized
        return errorTitle
    }()
    
    let errorDescriptionView: UIView = {
        let errorDescriptionView = UIView()
        
        let errorDescription = ErrorPopUpsConstants.description
        errorDescription.text = "NO_AMOUNT_DETECTED_DESCRIPTION".localized
        errorDescription.numberOfLines = 0
        errorDescription.lineBreakMode = .byWordWrapping
        errorDescriptionView.addSubview(errorDescription)
        errorDescription.leftAnchor.constraint(equalTo: errorDescriptionView.leftAnchor, constant: 6).isActive = true
        errorDescription.rightAnchor.constraint(equalTo: errorDescriptionView.rightAnchor, constant: -6).isActive = true
        errorDescription.topAnchor.constraint(equalTo: errorDescriptionView.topAnchor, constant:0).isActive = true
        errorDescription.bottomAnchor.constraint(equalTo: errorDescriptionView.bottomAnchor, constant: -15).isActive = true
        return errorDescriptionView
    }()
    
    let manualImportButton: UIButton = {
        let manualImportButton = ErrorPopUpsConstants.primaryButton
        manualImportButton.setTitle("NO_AMOUNT_DETECTED_MANUAL_IMPORT".localized, for: .normal)
        manualImportButton.addTarget(self, action: #selector(handleFollowTapped), for: .touchUpInside)
        return manualImportButton
    }()
    
    let newPhotoButton: UIButton = {
        let newPhotoButton = ErrorPopUpsConstants.secondaryButton
        newPhotoButton.setTitle("NO_AMOUNT_DETECTED_NEW_PHOTO".localized, for: .normal)
        newPhotoButton.addTarget(self, action: #selector(handleFollowTapped), for: .touchUpInside)
        return newPhotoButton
    }()
    
    let rootStackView: UIStackView = {
        let rootStackView = UIStackView()
        rootStackView.axis = .vertical
        rootStackView.distribution = .fill // default .fill
        rootStackView.alignment = .fill
        rootStackView.spacing = 15 // spacing by default between components
        rootStackView.translatesAutoresizingMaskIntoConstraints = false
        return rootStackView
    }()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Set background color
        self.view.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.85)
        
        // Add elements to StackView
        self.view.addSubview(rootStackView)
        rootStackView.addArrangedSubview(errorImageView)
        rootStackView.addArrangedSubview(errorTitle)
        rootStackView.addArrangedSubview(errorDescriptionView)
        rootStackView.addArrangedSubview(manualImportButton)
        rootStackView.addArrangedSubview(newPhotoButton)
        
        // StackView Constraints
        NSLayoutConstraint.activate([
            rootStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            rootStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            rootStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 32),
            rootStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -32),
        ])
        manualImportButton.applyGradient(colors: [ErrorPopUpsConstants.buttonSecondaryColor.cgColor, ErrorPopUpsConstants.buttonPrimaryColor.cgColor])
        
    }
    

    @objc func handleFollowTapped() {
        dismiss(animated: true, completion: nil)
    }
}

