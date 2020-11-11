//
//  ViewController.swift
//  FeedPasswordApp
//
//  Created by 조중윤 on 2020/11/11.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var levelView: UIView!
    @IBOutlet weak var descriptionLabel: UILabel!
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        let passwordLevel = passwordValidator(password: passwordTextField.text!)
        //1    red    아주 약한 암호
//        2    orange    약한 암호
//        3    yellow    보통 암호
//        4    blue    강한 암호
//        5    green    아주 강함 암호
        switch passwordLevel {
        case 1:
            levelView.backgroundColor = UIColor.red
            descriptionLabel.text = "아주 약한 암호"
        case 2:
            levelView.backgroundColor = UIColor.orange
            descriptionLabel.text = "약한 암호"
        case 3:
            levelView.backgroundColor = UIColor.yellow
            descriptionLabel.text = "보통 암호"
        case 4:
            levelView.backgroundColor = UIColor.blue
            descriptionLabel.text = "강한 암호"
        case 5:
            levelView.backgroundColor = UIColor.blue
            descriptionLabel.text = "아주 강한 암호"
        default:
            return
        }
    }
    
    func passwordValidator(password: String) -> Int {
        var levelCheck = [false, // password long enough
                              false, // contains number
                              false, // contains alphabet
                              false] // contains special character
            
            // check password length
            if password.count >= 8 {
                levelCheck[0] = true
            }
            let range = NSRange(location: 0, length: password.utf16.count)
            
            // check if password contains number, alphabet, or other characters
            let patternList = ["[0-9]", "[a-zA-Z]", "[^a-zA-Z0-9]"]
            for (ii, pattern) in patternList.enumerated() {
                let regex = try! NSRegularExpression(pattern: pattern)
                if regex.firstMatch(in: password, options: [], range: range) != nil {
                    levelCheck[ii+1] = true
                }
            }
            
            switch levelCheck {
            case [false, true, false, false]:
                return 1
            case [false, false, true, false]:
                return 2
            case [true, true, true, false]:
                return 4
            case [true, true, true, true]:
                return 5
            default:
                return 3
            }
    }
}

