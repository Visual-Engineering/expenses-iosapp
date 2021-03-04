//
//  TestViewController.swift
//  Napptilus Expenses
//
//  Created by Lluis Martinez on 04/03/2021.
//

import Foundation
import UIKit

class TestViewController: UIViewController {
    var button1: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button1 = UIButton(type: .system)
        
        button1.translatesAutoresizingMaskIntoConstraints = false
        button1.setTitleColor(.black, for: .normal)
        button1.setTitle("TEST TEST TEST", for: .normal)
        button1.backgroundColor = UIColor.cyan
        button1.addTarget(self, action: #selector(handleFollowTapped), for: .touchUpInside)
       
        self.view.addSubview(button1)
        
        // Constraints
        button1.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.0875).isActive = true
        button1.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.822).isActive = true
        button1.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        button1.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
    }
    
    @objc func handleFollowTapped() {
        let vc = AmountNotDetectedViewController()
        vc.modalPresentationStyle = .overCurrentContext
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true, completion: nil)
    }
}
