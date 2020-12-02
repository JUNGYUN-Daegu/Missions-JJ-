//
//  ViewController.swift
//  201130_week5_FinalProject
//
//  Created by 조중윤 on 2020/11/30.
//

import UIKit

class ViewController: UIViewController {
    let snowEmitter = SnowEmitter()
    
    let snowIcon = UIImage(systemName: "snow")
    var starIcon = UIImage(named: "star")
    let foodItems = ["chicken","sushi","spaghetti"]
    
    let centralLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.white
        label.font = UIFont(name: "Nerko One", size: 100)
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 1
        label.textAlignment = .center
        label.text = "test"
        return label
    }()
    
    let menuSelectBtn: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.hexString2UIColor(hexString: "#ffdada")
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.setTitle("SELECT", for: .normal)
        return button
    }()
    
    let backBtn: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.hexString2UIColor(hexString: "#ffdada")
        button.setTitle("BACK", for: .normal)
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        //FIXME:- how to set text color of button?
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.hexString2UIColor(hexString: "#31326f")
        
        view.addSubview(centralLabel)
        centralLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        centralLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        centralLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        centralLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3).isActive = true
        
        view.addSubview(menuSelectBtn)
        menuSelectBtn.rightAnchor.constraint(equalTo: view.centerXAnchor, constant: -10).isActive = true
        menuSelectBtn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        menuSelectBtn.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1).isActive = true
        menuSelectBtn.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.35).isActive = true
        menuSelectBtn.titleLabel?.font = UIFont(name: "Nerko One", size: view.frame.height / 20)
        menuSelectBtn.addTarget(self, action: #selector(menuSelectBtnPressed), for: .touchUpInside)

        view.addSubview(backBtn)
        backBtn.leftAnchor.constraint(equalTo: view.centerXAnchor, constant: 10).isActive = true
        backBtn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        backBtn.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1).isActive = true
        backBtn.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.35).isActive = true
        backBtn.titleLabel?.font = UIFont(name: "Nerko One", size: view.frame.height / 20)
        
        setupSnowEmitter()
    }
    
    func setupSnowEmitter() {
        let emitterLayer = snowEmitter.get(icon1: snowIcon!, icon2: starIcon!)
        // setting the center of emitter
        emitterLayer.emitterPosition = CGPoint(x: view.frame.width/2, y: 0)
        // setting the size of emitter
        emitterLayer.emitterSize = CGSize(width: view.frame.width, height: 1)
        view.layer.addSublayer(emitterLayer)
    }
    
    func setupFoodEmitter() {
        
    }
    
    @objc func menuSelectBtnPressed() {
        let randomMenu = foodItems.randomElement()
        
    }
    
    func updateUI() {
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

