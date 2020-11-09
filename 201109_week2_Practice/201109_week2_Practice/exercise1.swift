//
//  exercise1.swift
//  201109_week2_Practice
//
//  Created by 조중윤 on 2020/11/09.
//

import Foundation

//MARK: - Mission 1

struct ArrayPractice {
    func fillArray() -> Array<Array<Int>> {
        var outerArray: Array<Array<Int>> = []
        
        //배열의 길이가 입력값이 아니라 정해진 값이기 때문에 상수르 적음. 배열의 길이가 정해져 있지 않다면 상수 5 대신에 변수를 썼을듯
        for row in 0..<5 {
            var innerArray: Array<Int> = []
            
            for column in 0..<5 {
                if row >= column {
                    innerArray.append((row * 5) + (column + 1))
                }
            }
            outerArray.append(innerArray)
        }
        return outerArray
    }
    
    func printArray(array: Array<Array<Int>>) {
        for element in array {
            print (element)
        }
    }
}


//MARK: - Mission 2

func setBullArray() -> Array<Array<Bool>> {
    let tempWidthAndHeightOfArray = 9
    let innerArray: Array<Bool> = Array(repeating: false, count: tempWidthAndHeightOfArray)
    let outerArray: Array<Array<Bool>> = Array(repeating: innerArray, count: tempWidthAndHeightOfArray)
    
    return outerArray
}
    
func printArray(array: Array<Array<Bool>>, newChar: Character) {
    var myBullArray = array
    
    for row in 0..<myBullArray.count {
        for column in 0..<myBullArray[row].count {
            if  myBullArray[row].count - (column + 1) <= row {
                myBullArray[row][column] = true
            }
        }
        print(myBullArray[row].map { $0 == true ? "$" : " "})
    }
}

//MARK: - Mission 3 Magic square

func makeMagicSquare(row:Int) -> Array<Array<Int>> {
    var magicSquare: Array<Array<Int>> = Array(repeating: Array(repeating: 0, count: row), count: row)
    
    //후에 쓸 2차 배열 XY좌표의 최대 값을 특정
    let endCoordinateOfSquare = row - 1
    
    //마방진의 마지막 row 중간에 정수 1 고정
    var originalYCoordinate = endCoordinateOfSquare
    var originalXCoordinate = row/2
    
    magicSquare[originalYCoordinate][originalXCoordinate] = 1
    
    var nextYCoordinate = 0
    var nextXCoordinate = 0
    
    for nextInt in 2...row * row {
        
        //다음 숫자가 들어갈 좌표를 특정한다.
        if originalYCoordinate < endCoordinateOfSquare {
            nextYCoordinate = originalYCoordinate + 1
        } else {
            nextYCoordinate = 0
        }
        
        if originalXCoordinate < endCoordinateOfSquare {
            nextXCoordinate = originalXCoordinate + 1
        } else {
            nextXCoordinate = 0
        }
        
        //위에서 특정한 좌표에 이미 값이 있는지 확인한 다음 값이 이미 있다면 그에 따른 다음 좌표를 재지정
        if magicSquare[nextYCoordinate][nextXCoordinate] == 0 {
            magicSquare[nextYCoordinate][nextXCoordinate] = nextInt
            
            //nextInt를 기입했다면 original좌표들을 재설정
            originalYCoordinate = nextYCoordinate
            originalXCoordinate = nextXCoordinate
        } else {
            nextYCoordinate = originalYCoordinate - 1
            nextXCoordinate = originalXCoordinate
            
            magicSquare[nextYCoordinate][nextXCoordinate] = nextInt
            
            originalYCoordinate = nextYCoordinate
            originalXCoordinate = nextXCoordinate
        }
    }
    return magicSquare
}

func printMagicSquare(_ myMagicSquare:Array<Array<Int>>) {
    for row in myMagicSquare {
        print(row)
    }
}

