//
//  main.swift
//  LadderGame
//
//  Created by 조중윤 on 2020/11/05.
//

import Foundation

func userInput() -> Int {
    var input = readLine() ?? ""
    var intValue = Int(input) ?? 0
    
    while intValue < 2 || intValue > 8 {
        print("인원수가 2명보다 적거나 8명 초과: 다시 입력")
        input = readLine() ?? ""
        intValue = Int(input) ?? 0
    }
    return intValue
}

func printLadder() {
    let height = 4
    let numberOfParticipant = userInput()
    var ladder: Array<Array<String>> = []
    
    for row in 1...height {
        var innerArray: Array<String> = []
        
        for column in 1...(numberOfParticipant * 2) - 1 {
            let randomNumber = Int.random(in: 1...2)
            
            if column % 2 == 1 {
                innerArray.append("|")
            } else {
                randomNumber == 1 ? innerArray.append("-"):innerArray.append(" ")
            }
        }
        ladder.append(innerArray)
        print(ladder[row-1].joined())
    }
}

printLadder()
