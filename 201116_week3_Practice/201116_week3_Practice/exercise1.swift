//
//  exercise1.swift
//  201116_week3_Practice
//
//  Created by 조중윤 on 2020/11/16.
//

import Foundation

//Matrix Calculation Mission
class Matrix {
    // default value = 0 <- is not necessary if you created initializer
    var a: Double = 0
    var b: Double = 0
    var c: Double = 0
    var d: Double = 0
    
    // initializer, remember parameter name "a" is not same with member variable(property) of class Matrix
    init(a: Double, b: Double, c: Double, d: Double) {
        // remember to put "self" to specify class's member variable
        self.a = a // to put parameter a (which would be given as Double when initialized) to property a
        self.b = b
        self.c = c
        self.d = d
    }
    
    func sum(with other: Matrix) -> Matrix {
        let summedA = a + other.a
        let summedB = b + other.b
        let summedC = c + other.c
        let summedD = d + other.d
        
        // putting a += other.a directly to the argument did not work
        return Matrix(a: summedA, b: summedB, c: summedC, d: summedD)
    }
    
    func product(with other: Matrix) -> Matrix {
        let calculatedA = (a * other.a) + (b * other.c)
        let calculatedB = (a * other.b) + (b * other.d)
        let calculatedC = (c * other.a) + (d * other.c)
        let calculatedD = (c * other.b) + (d * other.d)
        
        return Matrix(a: calculatedA, b: calculatedB, c: calculatedC, d: calculatedD)
    }
}

