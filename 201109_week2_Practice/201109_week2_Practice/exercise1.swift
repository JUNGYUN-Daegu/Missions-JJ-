//
//  exercise1.swift
//  201109_week2_Practice
//
//  Created by 조중윤 on 2020/11/09.
//

import Foundation

//MARK: - Mission 1

struct ArrayPractice {
    func fillArray() -> Array<Array<Int>> {
        var outerArray: Array<Array<Int>> = []
        
        //배열의 길이가 입력값이 아니라 정해진 값이기 때문에 상수르 적음. 배열의 길이가 정해져 있지 않다면 상수 5 대신에 변수를 썼을듯
        for row in 0..<5 {
            var innerArray: Array<Int> = []
            
            for column in 0..<5 {
                if row >= column {
                    innerArray.append((row * 5) + (column + 1))
                }
            }
            outerArray.append(innerArray)
        }
        return outerArray
    }
    
    func printArray(array: Array<Array<Int>>) {
        for element in array {
            print (element)
        }
    }
}
