//
//  exercise5.swift
//  201109_week2_Practice
//
//  Created by 조중윤 on 2020/11/09.
//

import Foundation

func antFunction(inputArray: Array<Int>) -> Array<Int> {
    var resultArray: Array<Int> = []
    var previousNumber: Int = 1
    var count: Int = 0
    
    for (index, element) in inputArray.enumerated() {
        if element != previousNumber {
            resultArray.append(previousNumber)
            resultArray.append(count)
            previousNumber = element
            count = 1
            if index == inputArray.count - 1 {
                resultArray.append(previousNumber)
                resultArray.append(count)
            }
        } else {
            count += 1
            if index == inputArray.count - 1 {
                resultArray.append(previousNumber)
                resultArray.append(count)
            }
        }
    }
    return resultArray
}
