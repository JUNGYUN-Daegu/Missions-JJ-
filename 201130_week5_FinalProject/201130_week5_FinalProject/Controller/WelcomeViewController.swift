//
//  WelcomeViewController.swift
//  201130_week5_FinalProject
//
//  Created by 조중윤 on 2020/12/01.
//

import UIKit

class WelcomeViewController: UIViewController {
    let centerButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.hexString2UIColor(hexString: "#dbf6e9")
        button.tintColor = UIColor.hexString2UIColor(hexString: "#31326f")
        button.setTitle("LET IT SNOW", for: .normal)
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(letItSnow), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.hexString2UIColor(hexString: "#ffdada")
        view.addSubview(centerButton)
        centerButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        centerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        centerButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1).isActive = true
        centerButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
    
    @objc func letItSnow() {
        self.performSegue(withIdentifier: "onlySegue", sender: self)
    }
}

//FIXME:- 버튼 눌리면 중앙에서부터 "#31326f"컬러 확장되게 만들기
