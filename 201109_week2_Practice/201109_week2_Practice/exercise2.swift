//
//  exercise2.swift
//  201109_week2_Practice
//
//  Created by 조중윤 on 2020/11/09.
//

import Foundation

func IDValidator() -> Bool {
    print(
"""
ID를 입력하세요:
5글자 미만이거나 24글자 이상이면 실패
영문 대소문자, 숫자, -만 포함 가능하고 그 외에는 실패
같은 숫자가 연속해서 3회 이상 나오면 실패 111, 222
숫자가 연번으로 3개나오면 실패 123, 234
위 조건을 모두 통과하면 성공
"""
    )
    var result = true
    let userInput = readLine() ?? ""
    let regex1 = try! NSRegularExpression(pattern: "[a-z0-9-]{6,23}", options: .caseInsensitive)
    
    if regex1.matches(userInput) == false {
        result = false
    } else {
        let componentsInUserInput = userInput.components(separatedBy: CharacterSet.decimalDigits.inverted)
        
        for element in componentsInUserInput {
            if let number = Int(element) {
                if (number % 100 / 10) == (number / 100 + 1) && (number % 10) == (number % 100 / 10 + 1) {
                    result = false
                } else if (number % 100 / 10) == (number / 100) && (number % 10) == (number % 100 / 10) {
                    result = false
                }
            }
        }
    }
  
  return result
}

extension NSRegularExpression {
    func matches(_ string: String) -> Bool {
        // location: starting point of range, length: how many times you want to check each of elements
        let range = NSRange(location: 0, length: string.utf16.count)
        return firstMatch(in: string, options: [], range: range) != nil
    }
}


//FIXME:- 실패한 코드들
    
//    let charSet = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890-")
//
////    for letter in userInput {
////        if charSet.contains(letter.unicodeScalars.map { $0.value }.reduce(0, +1)) {
////
////        }
////    }
//
//
//    if userInput.count < 5 && userInput.count >= 24 {
//        return false
//    } else if userInput.ran {
//
//    }

