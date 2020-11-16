//
//  exercise2.swift
//  201116_week3_Practice
//
//  Created by 조중윤 on 2020/11/16.
//

import Foundation

//Binary Number Structure
struct SpecialBinaryNumber {
    private var valueArray: Array<String> = []
    // count 프로퍼티 private 접근자 사용시 main 파일에서 해당 값 열람 불가능
    var count: Int {
        return valueArray.count
    }
    
    init(with total: Int) {
        for _ in 1...50 {
            // if binary code is 5 digits, the max value of it in decimal is 2^5 - 1.
            let maxValue = pow(2, total) - 1
            // putting maxValue(decimal) into NSDecimalNumber so that later it can be type casted into Int?
            let valueDecimal = NSDecimalNumber(decimal: maxValue)
            let maxInt = Int(truncating: valueDecimal)
            let randomNumber: Int = Int.random(in: 0...maxInt)
            // radix?
            let binaryString = String(randomNumber, radix: 2)
            
            // padding the binaryString to make all have 5 digits
            var padded = binaryString
            
            for _ in 0..<(total - binaryString.count) {
                padded = "0" + padded
            }
            
            valueArray.append(padded)
        }
    }
    
    func find(by bitCount: Int) -> Array<String> {
        let result = valueArray.filter { (string) -> Bool in
            var numberOfOne = 0
            for letter in string {
                if letter == "1" {
                    numberOfOne += 1
                }
            }
           return numberOfOne == bitCount
        }
        return result
    }
}
