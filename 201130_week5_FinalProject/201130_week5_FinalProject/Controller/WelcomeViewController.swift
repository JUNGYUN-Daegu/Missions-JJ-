//
//  WelcomeViewController.swift
//  201130_week5_FinalProject
//
//  Created by 조중윤 on 2020/12/01.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Do You Snow What We Eat Tonight?"
        label.font = UIFont(name: "Nerko One", size: 50)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = UIColor.white
        return label
    
    }()
    
    let centerButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.hexString2UIColor(hexString: "#ffdada")
        button.setTitle("LET US SNOW", for: .normal)
        button.tintColor = UIColor.hexString2UIColor(hexString: "#31326f")
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.hexString2UIColor(hexString: "#31326f")
        
        view.addSubview(titleLabel)
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        titleLabel.heightAnchor.constraint(lessThanOrEqualTo: view.heightAnchor, multiplier: 0.3).isActive = true
        titleLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        
        view.addSubview(centerButton)
        centerButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        centerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        centerButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1).isActive = true
        centerButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        centerButton.layer.cornerRadius = view.frame.height / 20
        centerButton.clipsToBounds = true
        centerButton.titleLabel?.font = UIFont(name: "Nerko One", size: view.frame.height / 30)
        centerButton.addTarget(self, action: #selector(letItSnow), for: .touchUpInside)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @objc func letItSnow() {
        self.performSegue(withIdentifier: "onlySegue", sender: self)
    }
}

//FIXME:- 버튼 눌리면 중앙에서부터 "#31326f"컬러 확장되게 만들기
