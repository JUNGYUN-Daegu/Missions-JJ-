//
//  NumberBaseballGameManager.swift
//  NumberBaseballGame
//
//  Created by 조중윤 on 2020/11/11.
//

import Foundation

struct NumberBaseballGameManager {
    var answer: Array<Int> = []
    
    mutating func newGame() {
        for _ in 0...2 {
            answer.append(Int.random(in: 1...9))
        }
    }

    func hit(num: Int) -> (strikeCount: Int, ballCount: Int) {
        var strike: Int = 0
        var ball: Int = 0
        var userAnswerArray: Array<Int> = []
        
        userAnswerArray.append(num/100)
        userAnswerArray.append((num/10) % 10)
        userAnswerArray.append(num%10)
        
        for eachElement in 0...2 {
            if answer[eachElement] == userAnswerArray[eachElement] {
                strike += 1
            } else {
                if answer.contains(userAnswerArray[eachElement]) {
                    ball += 1
                }
            }
        }
        let result = (strikeCount: strike, ballCount: ball)
        return result
    }
    
//FIXME:- how to implement this function in main swift file?
    mutating func showGameScore() -> Bool {
        newGame()
        print(answer)
        var count = 9
        var result = (strikeCount: 0, ballCount: 0)
        
        //while 문이 다 돌아가면 result가 정답인 값이 되거나 count가 0이 되거나 둘 다 된다.
        while (result != (strikeCount: 3, ballCount: 0) && count > 0) {
            let userAnswer = readLine() ?? ""
            let userAnswerInInt = Int(userAnswer)!
            result = hit(num: userAnswerInInt)
            print(result)
            count -= 1
        }
        
        //이때 count 개수로 성공 실패 여부를 가린다. 이때 마지막 count에 정답은 맞춘 경우를 생각해서 그 조건을 더 붙여준다.
        if count > 0 {
            return true
        } else if count == 0 && result == (strikeCount: 3, ballCount: 0) {
            return true
        } else {
            return false
        }
    }
}
