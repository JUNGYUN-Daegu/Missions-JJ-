//
//  exercise2.swift
//  201109_week2_Practice
//
//  Created by 조중윤 on 2020/11/09.
//

import Foundation

func IDValidator() {
    print(
"""
ID를 입력하세요:
5글자 미만이거나 24글자 이상이면 실패
영문 대소문자, 숫자, -만 포함 가능하고 그 외에는 실패
같은 숫자가 연속해서 3회 이상 나오면 실패 111, 222
숫자가 연번으로 3개나오면 실패 123, 234
위 조건을 모두 통과하면 성공
"""
    )
    
    guard let input = readLine() else {
        return
    }
    
    //NSRegularExpression을 이용해서 간단한 Regular Expression의 성공, 실패 여부 판단은 성공했으나 복잡한 조건 짜는 법을 모르겠음
    do {
        let range = NSRange(location: 0, length: input.count)
        let regex = try NSRegularExpression(pattern: "[A-Za-z0-9]")
        
        let result = regex.matches(in: input, options: [], range: range).map{
            String(input[Range($0.range, in: input)!])
        }
        
        //조건에 맞지 않는 input을 입력받으면 []을 반환하는 것에 착안
        if result != [] {
            print("성공")
        } else {
            print("실패")
        }
        
    } catch {
        print("regex Error")
    }
}
