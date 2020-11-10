//
//  ViewController.swift
//  HelloCafe
//
//  Created by 조중윤 on 2020/11/10.
//

import UIKit

class ViewController: UIViewController {
    var mainImageView: UIImageView = {
        let myUIimageView = UIImageView()
        myUIimageView.translatesAutoresizingMaskIntoConstraints = false
        myUIimageView.layer.cornerRadius = 10
        myUIimageView.mask?.clipsToBounds = true
        myUIimageView.backgroundColor = UIColor.red
        return myUIimageView
    }()
    
    var myButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.systemBlue
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(mainImageView)
        mainImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        mainImageView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        mainImageView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.5).isActive = true
        mainImageView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.7).isActive = true
        mainImageView.image = UIImage(named: "green-tea.jpg")
    
        view.addSubview(myButton)
        myButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        myButton.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.1).isActive = true
        myButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.5).isActive = true
        myButton.topAnchor.constraint(equalTo: mainImageView.bottomAnchor, constant: 10).isActive = true
    }
    @objc func buttonPressed() {
        mainImageView.image = mainImageView.image == UIImage(named: "green-tea.jpg") ? UIImage(named: "cafe-latte.jpg") : UIImage(named: "green-tea.jpg")
    }
}

