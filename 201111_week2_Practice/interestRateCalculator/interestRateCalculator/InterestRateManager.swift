//
//  InterestRateManager.swift
//  interestRateCalculator
//
//  Created by 조중윤 on 2020/11/11.
//

//MARK:- InterestCalculation(이자율 계산 구조체)
import Foundation

struct InterestRateManager {
    func getInterestRate(byDay: Int) -> Double {
        switch byDay {
        case 1...90: return 0.005
        case 91...180: return 0.01
        case 181...364: return 0.02
        default: return 0.056
        }
    }
    
    func calculateAmount(day:Int, amount:Int) -> Double {
        let interestRate = getInterestRate(byDay: day)
        let daysOfAnYear: Double = 365
        let dailyInterest: Double = interestRate/daysOfAnYear
        let interestAfterCertainDays: Double = Double(amount) * dailyInterest * Double(day)
        let totalDeposit: Double = Double(amount) + interestAfterCertainDays
        
        return totalDeposit
    }
}
