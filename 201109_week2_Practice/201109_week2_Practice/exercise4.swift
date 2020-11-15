//
//  exercise4.swift
//  201109_week2_Practice
//
//  Created by 조중윤 on 2020/11/15.
//

import Foundation

func validResidentRegistrationNumber() -> Bool {
    let userInput: String = readLine() ?? ""
    var numberArray: Array<Int> = []
    
    for element in userInput {
        // Could not convert character into Int directly. Changed Char into String, and into Int(Optional)
        if let number = Int(String(element)) {
            numberArray.append(number)
        }
    }
    
    var temp: Int = 0
    
    for (index, number) in numberArray.enumerated() {
        if index < 8 {
            temp += number * (index + 2)
        } else if index >= 8 && index < 12 {
            temp += number * (index - 6)
        }
    }
    
    temp %= 11
    temp = (11 - temp) % 10
    
    if temp == numberArray.last {
        return true
    } else {
        return false
    }
}
