//
//  ViewController.swift
//  PracticeCalculator
//
//  Created by 조중윤 on 2020/11/18.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var displayLabel: UILabel!
    @IBOutlet weak var debuggingLabel: UILabel!
    
    var myCalculator = Calculator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateDisplayLabel()
    }

//MARK:- IBAction: Number Buttons Pressed
    @IBAction func numberPressed(_ sender: UIButton) {
        numberEntry(sender)
        updateDisplayLabel()
    }
//MARK:- IBAction: Operation Button Pressed
    @IBAction func operationBtnPressed(_ sender: UIButton) {
        myCalculator.displayedNumberStringToDouble()
        myCalculator.stackCurrentNumber()
        myCalculator.stackOperation(input: (sender.title(for: .normal)!))
        print(myCalculator.stack)
        print(myCalculator.operationStack)
        myCalculator.displayedNumberString = ""
        
        updateDisplayLabel()
    }
    
    @IBAction func equalPressed(_ sender: UIButton) {
        myCalculator.displayedNumberStringToDouble()
        myCalculator.stackCurrentNumber()
        print(myCalculator.stack)
        
        var result: Double = 0.0
        var operation:(Double, Double) -> Double = (+)
        
        for (index, element) in myCalculator.stack.enumerated() {
            if index == 0 {
                result += element
            } else {
                print(index)
                switch myCalculator.operationStack[index - 1] {
                case "+": operation = (+)
                case "-": operation = (-)
                case "÷": operation = (/)
                case "×": operation = (*)
                default: return
                }
                result = operation(result, element)
            }
        }
        
        if floor(result) == result {
            myCalculator.displayedNumberString = String(format: "%.0f", result)
        } else {
            myCalculator.displayedNumberString = String(result)
        }
        
        print(String(result))
        myCalculator.number = 0.0
        myCalculator.stack = []
        myCalculator.operationStack = []
    
        updateDisplayLabel()
    }
    
//MARK:- Functions
    func numberEntry(_ sender: UIButton) {
        if displayLabel.text!.count >= 18 {
            debuggingLabel.text = "값 범위 초과"
        } else {
            myCalculator.displayedNumberManipulation(input: sender.title(for: .normal)!)
        }
    }
    func updateDisplayLabel() {
        displayLabel.text = myCalculator.displayedNumberString
    }
}

//MARK:- Calculating Structure
struct Calculator {
    var displayedNumberString: String = ""
    var number: Double = 0
    var stack : Array<Double> = []
    var operationStack: Array<String> = []
    
    //String Input
    mutating func displayedNumberManipulation(input: String) {
        displayedNumberString.append(input)
    }
    
    mutating func displayedNumberStringToDouble() {
        if let doubleValue = Double(displayedNumberString) {
            number = doubleValue
        }
    }
    
    mutating func stackCurrentNumber() {
        stack.append(number)
    }
    
    mutating func stackOperation(input: String) {
        operationStack.append(input)
    }
}
