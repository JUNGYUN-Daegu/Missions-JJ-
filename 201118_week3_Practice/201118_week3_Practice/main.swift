//
//  main.swift
//  201118_week3_Practice
//
//  Created by 조중윤 on 2020/11/18.
//

import Foundation

let myBracketStructure = BracketStructure(type: .round)

let generatedBracketSet = myBracketStructure.generate(with: 8)
print(generatedBracketSet)

for everyBracketSet in generatedBracketSet {
    print(myBracketStructure.analyze(with: everyBracketSet))
}

