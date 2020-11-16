//
//  exercise3.swift
//  201116_week3_Practice
//
//  Created by 조중윤 on 2020/11/16.
//

import Foundation

// Bubble Sort
class BubbleSort {
    private var myArray: Array<Int>
    
    init(numberArray: Array<Int>) {
        self.myArray = numberArray
    }
    
    func sorted(isAscending: Bool) -> Array<Int> {
        var sortedArray = myArray
        var swapped = false
        
        //FIXME:- logic ...
        for (index, value) in 0..<myArray.count - 1 {
        }
        
        return sortedArray
    }
    
    // inout: need the updated values to be available after the function call
    func swap(tempArray: inout Array<Int>, aIndex: Int, bIndex: Int) {
        var temp = tempArray[aIndex]
        tempArray[aIndex] = tempArray[bIndex]
        tempArray[bIndex] = temp
        
    }
}
