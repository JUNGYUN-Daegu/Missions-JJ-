//
//  exercise5.swift
//  201109_week2_Practice
//
//  Created by 조중윤 on 2020/11/09.
//

import Foundation

func antFunction(inputArray: Array<Int>, numberOfLines: Int) -> Array<Array<Int>> {
    var resultArray: Array<Array<Int>> = []
    var previousArray: Array<Int> = []
    
    for time in 1...numberOfLines {
        var newArray: Array<Int> = []
        var count: Int = 0
        var value: Int = 0
        
        if time == 1 {
            newArray = inputArray
        } else {
            for element in previousArray {
                //아래부분 로직 다시 짜기
                if value == element {
                    count += 1
                } else {
                    if value != 0 && count != 0 {
                        newArray.append(value)
                        newArray.append(count)
                    } else {
                        value = element
                        count = 1
                        newArray.append(value)
                        newArray.append(count)
                    }
                }
            }
        }
        resultArray.append(newArray)
        previousArray = newArray
    }
    return resultArray
}
