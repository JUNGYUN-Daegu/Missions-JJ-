//
//  exercise1.swift
//  201118_week3_Practice
//
//  Created by 조중윤 on 2020/11/18.
//
// bracket pair check

import Foundation

// how to name structure?
struct BracketStructure {
    var openingBracket: String
    var closingBracket: String
    
    enum Bracket {
        case round
        case square
        case curly
    }
    
    init(type: Bracket) {
        switch type {
        case .round: self.openingBracket = "("
                     self.closingBracket = ")"
        case .square: self.openingBracket = "["
                      self.closingBracket = "]"
        case .curly: self.openingBracket = "{"
                     self.closingBracket = "}"
        }
    }
    
    func generate(with count: Int) -> Array<String> {
        var result = Array<String>()
        
        // ex) "(((())))"
        var basicBracketSet = String(repeating: openingBracket, count: count/2)
        basicBracketSet.append(String(repeating: closingBracket, count: count/2))
        result.append(basicBracketSet)
        //range로 바꿔보기
        var rightHandBracketIndex = 0
        repeat {
            // should not move 0 index bracket
            for leftHandBracketIndex in 1...count/2 - 1 {
                var tempArray = Array(basicBracketSet)
                tempArray.swapAt(leftHandBracketIndex, count/2 + rightHandBracketIndex)
                
                // error without mapping: Referencing instance method 'joined(separator:)' on 'BidirectionalCollection' requires the types 'String.Element' (aka 'Character') and 'String' be equivalent
                let resultString = tempArray.map { String($0)}.joined()
                result.append(resultString)
            }
            rightHandBracketIndex += 1
        } while (rightHandBracketIndex < count/2 - 1)
        return result
    }
    
    func analyze(with value: String) -> Bool {
        var openingBracketCount = 0
        var closingBracketCount = 0
        
        for element in value.reversed() {
            if element == Character(closingBracket) {
                closingBracketCount += 1
            } else {
                openingBracketCount += 1
            }
        }
        return openingBracketCount == closingBracketCount
    }
}

