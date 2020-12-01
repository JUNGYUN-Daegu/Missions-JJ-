//
//  ViewController.swift
//  201130_week5_FinalProject
//
//  Created by 조중윤 on 2020/11/30.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.hexString2UIColor(hexString: "#31326f")
        setupEmitter()
    }
    
    func setupEmitter() {
        let emitterLayer = Emitter.get()
        // setting the center of emitter
        emitterLayer.emitterPosition = CGPoint(x: view.frame.width/2, y: 50)
        // setting the size of emitter
        emitterLayer.emitterSize = CGSize(width: view.frame.width, height: 1)
        view.layer.addSublayer(emitterLayer)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

