//
//  File.swift
//  201109_week2_Practice
//
//  Created by 조중윤 on 2020/11/11.
//

import Foundation

func passwordValidator(password:String) -> Int {
    print ("""
            숫자로만 구성되고 길이가 8글자 미만 : 아주 약한 암호(1 Level)
            영문자로만 구성되고 길이가 8글자 미만 : 약한 암호 (2 Level)
            영문자와 한 개 이상의 숫자로 구성되어 있고 길이 8글자 이상 : 강한 암호 (4 Level)
            영문자와 숫자, 특수문자로 구성되어 있고 길이가 8글자 이상 : 아주 강한 암호 (5 Level)
            나머지 경우는 : 보통 암호 (3 Level)
    """
    )
    
    var conditions = [
        false, // length
        false, // alphabet
        false, // number
        false // special character
                     ]
    
    let userInput = password
    let lengthGreaterOrEqualToEight = try! NSRegularExpression(pattern: ".{8,}", options: .caseInsensitive)
    let containsMoreThanOneAlphabet = try! NSRegularExpression(pattern: "[a-z]", options: .caseInsensitive)
    let containsMoreThanOneNumber = try! NSRegularExpression(pattern: "[0-9]")
    let containsMoreThanOneSpecialCharacter = try! NSRegularExpression(pattern: "[+_*&%$#@!]")
    let regexArray = [lengthGreaterOrEqualToEight, containsMoreThanOneAlphabet, containsMoreThanOneNumber, containsMoreThanOneSpecialCharacter]
    
    for (index, regex) in regexArray.enumerated() {
        // regular expression's extension was created in exercise2.swift
        if regex.matches(userInput) == true {
            conditions[index] = true
        }
    }
    
    //FIXME:- How to make this more understandable? like putting some title at each element 
    switch conditions {
    case [false, false, true, false]: return 1
    case [false, true, false, false]: return 2
    case [true, true, true, false]: return 4
    case [true, true, true, true]: return 5
    default: return 3
    }
}

