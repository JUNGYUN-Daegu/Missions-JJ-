//
//  exercise6.swift
//  201109_week2_Practice
//
//  Created by 조중윤 on 2020/11/09.
//

import Foundation

func duplicatedWords(inputWords: Array<String>) -> Array<String> {
    var result: Array<String> = []
    var tempArray: Array<String> = []
    
    for word in inputWords {
        if tempArray.contains(word) {
            if result.contains(word) == false {
                result.append(word)
            }
        } else {
            tempArray.append(word)
        }
    }
    return result
}

