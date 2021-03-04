//
//  ViewController.swift
//  Napptilus Expenses
//
//  Created by Lluis Martinez on 25/02/2021.
//

import UIKit

class AmountNotDetectedViewController: UIViewController {
    var imageView: UIImageView!
    var label1: UILabel!
    var label2: UILabel!
    var button1: UIButton!
    var button2: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set background color
        self.view.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.85)
        
        // Set image
        set_images()
        
        // Set labels
        set_labels()
        
        // Set buttons
        set_buttons()
        
    }
    
    func set_images() {
        let screenHeight = view.safeAreaLayoutGuide.layoutFrame.size.height
        let imageName = "ic_no_detected"
        let image = UIImage(named: imageName)
        imageView = UIImageView(image: image!)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(imageView)
        
        // Constraints
        imageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.0875).isActive = true
        imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0.22*screenHeight).isActive = true
        imageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
    }
    
    func set_labels() {
        let screenWidth = UIScreen.main.bounds.width
        
        label1 = UILabel()
        
        label1.translatesAutoresizingMaskIntoConstraints = false
        label1.font = UIFont(name: "Helvetica-Bold", size: (0.861*screenWidth*18/310))
        label1.textAlignment = .center
        label1.text = "Importe no detectado"
        label1.textColor = UIColor.red
        
        self.view.addSubview(label1)
        
        // Constraints
        // label1.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.861).isActive = true
        //label1.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.033).isActive = true
        //label1.adjustsFontSizeToFitWidth = true
        label1.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 14.2).isActive = true
        label1.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true

        
        label2 = UILabel()
        
        label2.translatesAutoresizingMaskIntoConstraints = false
        label2.font = UIFont(name: "Helvetica", size: 0.75*screenWidth*16/271)
        label2.textAlignment = .center
        label2.text = "No se ha reconocido ningún importe.\nIntrodúcelo manualmente o fotografía\nel ticket de nuevo."
        label2.numberOfLines = 3
        label2.lineBreakMode = .byWordWrapping
        label2.textColor = UIColor.white
        
        self.view.addSubview(label2)
        
        // Constraints
        //label2.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.753).isActive = true
        //label2.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.09).isActive = true
        //label2.adjustsFontSizeToFitWidth = true
        label2.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: 0).isActive = true
        label2.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
    }
    
    func set_buttons() {
        let screenHeight = view.safeAreaLayoutGuide.layoutFrame.size.height
        let screenWidth = UIScreen.main.bounds.width
        let colors = [UIColor(red: 0.0, green: 0.56, blue: 0.78, alpha: 1.0).cgColor, UIColor(red: 0.0, green: 0.81, blue: 1.0, alpha: 1.0).cgColor]
        let fontSize = (0.823*screenWidth*16/296)
        let radiusSize = (0.0875*screenHeight*28/56)
        
        button1 = UIButton(type: .system)
        
        button1.translatesAutoresizingMaskIntoConstraints = false
        button1.setTitleColor(.white, for: .normal)
        button1.setTitle("Introducir importe manualmente", for: .normal)
        button1.titleLabel?.font = UIFont(name: "Helvetica-Bold", size: fontSize)
        button1.addTarget(self, action: #selector(handleFollowTapped), for: .touchUpInside)
        button1.layer.cornerRadius = radiusSize
       
        self.view.addSubview(button1)
        
        // Constraints
        button1.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.0875).isActive = true
        button1.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.822).isActive = true
        button1.applyGradient(colors: colors) // GradientLayer needs to know the size
        button1.topAnchor.constraint(greaterThanOrEqualTo: label2.bottomAnchor, constant: 28.4).isActive = true
        button1.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        
        
        button2 = UIButton(type: .system)
        
        button2.translatesAutoresizingMaskIntoConstraints = false
        button2.backgroundColor = UIColor.clear
        button2.setTitleColor(UIColor(red: 0.0, green: 0.78, blue: 1.0, alpha: 1.0), for: .normal)
        button2.setTitle("Fotografiar de nuevo", for: .normal)
        button2.titleLabel?.font = UIFont(name: "Helvetica-Bold", size: fontSize)
        button2.layer.borderWidth = 2.0
        button2.layer.borderColor = UIColor(red: 0.0, green: 0.78, blue: 1.0, alpha: 1.0).cgColor
        button2.addTarget(self, action: #selector(handleFollowTapped), for: .touchUpInside)
        button2.layer.cornerRadius = radiusSize
        
        self.view.addSubview(button2)
        
        // Constraints
        button2.heightAnchor.constraint(equalTo: button1.heightAnchor).isActive = true
        button2.widthAnchor.constraint(equalTo: button1.widthAnchor).isActive = true
        button2.topAnchor.constraint(equalTo: button1.bottomAnchor, constant: 21.3).isActive = true
        button2.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -0.22*screenHeight).isActive = true
        button2.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
    }

    @objc func handleFollowTapped() {
        dismiss(animated: true, completion: nil)
    }
}

