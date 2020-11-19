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

//MARK:- IBActions
    @IBAction func numberPressed(_ sender: UIButton) {
        numberEntry(sender)
        updateDisplayLabel()
    }
    
    @IBAction func operationBtnPressed(_ sender: UIButton) {
        myCalculator.passDisplayedNumberToCurrentNumber()
        myCalculator.stackCurrentNumber()
        myCalculator.stackOperation(input: (sender.title(for: .normal)!))
        myCalculator.displayedNumberString = ""
        updateDisplayLabel()
    }
    
    @IBAction func equalPressed(_ sender: UIButton) {
        myCalculator.passDisplayedNumberToCurrentNumber()
        myCalculator.stackCurrentNumber()
        debuggingLabel.text = "숫자 \(myCalculator.stack)과 연산자 \(myCalculator.operationStack) 로 계산"
        myCalculator.calculation()
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
    var currentNumber: Double = 0
    var stack : Array<Double> = []
    var operationStack: Array<String> = []
    
    //String Input
    mutating func displayedNumberManipulation(input: String) {
        displayedNumberString.append(input)
    }
    
    mutating func passDisplayedNumberToCurrentNumber() {
        if let doubleValue = Double(displayedNumberString) {
            currentNumber = doubleValue
        }
    }
    
    mutating func stackCurrentNumber() {
        stack.append(currentNumber)
    }
    
    mutating func stackOperation(input: String) {
        operationStack.append(input)
    }
    
    mutating func calculation() {
        var result: Double = 0.0
        var operation:(Double, Double) -> Double = (+)
        
        for (index, element) in stack.enumerated() {
            if index == 0 {
                result += element
            } else {
                switch operationStack[index - 1] {
                case "+": operation = (+)
                case "-": operation = (-)
                case "÷": operation = (/)
                case "×": operation = (*)
                default: return
                }
                result = operation(result, element)
            }
        }
        // end of For-Loop, start displaying numbers
        // get rid of decimal point numbers when not needed
        if floor(result) == result {
            displayedNumberString = String(format: "%.0f", result)
        } else {
            displayedNumberString = String(result)
        }
        
        // initializing properties
        currentNumber = 0.0
        stack = []
        operationStack = []
    }
}

//MARK:- Issues
// Shake Gesture로 계산기 초기화 하는 것 구현해보기
// NumberFormatter로 결과값 포맷팅하기
// Stack.arrangeSubview 활용해서 스택 관리해보기
