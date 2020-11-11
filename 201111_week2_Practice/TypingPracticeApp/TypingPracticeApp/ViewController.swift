//
//  ViewController.swift
//  TypingPracticeApp
//
//  Created by 조중윤 on 2020/11/11.
//

import UIKit

class ViewController: UIViewController {
    var textArray = ["Apple", "Grape", "Orange", "Banana", "Kiwi", "Peach", "Durian", "Out", "Of", "Idea"]
    
    @IBOutlet weak var currentTextField: UILabel!
    @IBOutlet weak var nextTextField: UILabel!
    @IBOutlet weak var inputField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentTextField.text = textArray.randomElement()
        nextTextField.text = textArray.randomElement()
        
        // handle duplicated element at each of the textFields
        while (currentTextField.text == nextTextField.text) {
            nextTextField.text = textArray.randomElement()
        }
        displayedTextDelete()
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        if inputField.text == currentTextField.text {
            currentTextField.text = nextTextField.text
            nextTextField.text = textArray.randomElement()
            inputField.text = ""
            displayedTextDelete()
        } else {
            inputField.text = ""
        }
    }
    
    // remove currently being displayed Strings from textArray
    func displayedTextDelete() {
        if let index = textArray.firstIndex(of: currentTextField.text ?? "") {
            textArray.remove(at: index)
        }
        if let index = textArray.firstIndex(of: nextTextField.text ?? "") {
            textArray.remove(at: index)
        }
    }
}
//MARK:- Additional Mission

//흰 배경을 터치하면 보였던 소프트 키보드가 사라진다.
//틀렸을 때 Label에 글자색을 red로 표시한다. 맞추면 다시 black으로 변경한다.
