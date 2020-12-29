//
//  exercise3.swift
//  201116_week3_Practice
//
//  Created by 조중윤 on 2020/11/16.
//

import Foundation

// Bubble Sort
class BubbleSort {
    var myArray: Array<Int>
    
    init(numberArray: Array<Int>) {
        self.myArray = numberArray
    }
    
    func sorted(isAscending: Bool) {
        
        for i in 0...myArray.count - 2 {
            for j in i + 1...myArray.count - 1 {
                if isAscending == true {
                    if myArray[i] > myArray[j] {
                            swapped(firstIndex: i, secondIndex: j)
                    }
                } else {
                    if myArray[i] < myArray[j] {
                            swapped(firstIndex: i, secondIndex: j)
                    }
                }
            }
        }
    }
    
    func swapped(firstIndex: Int, secondIndex: Int) {
        var temp = 0
        temp = myArray[firstIndex]
        myArray[firstIndex] = myArray[secondIndex]
        myArray[secondIndex] = temp
    }
}
