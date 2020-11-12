//
//  main.swift
//  interestRateCalculator
//
//  Created by 조중윤 on 2020/11/11.
//

import Foundation

let interestRateManager = InterestRateManager()

func testInterest(unitDay: Int) -> Double {
    let principal = 1_000_000
    var totalAmount: Double = 0
    
    for interval in stride(from: 0, through: 365, by: unitDay) {
        totalAmount = interestRateManager.calculateAmount(day: interval, amount: principal)
        print(interval)
        print(round(totalAmount))
    }
    return round(totalAmount)
}

//How to use the return of "testInterest" function to keep track of balance records?
_ = testInterest(unitDay: 5)
