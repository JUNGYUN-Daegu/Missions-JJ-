//
//  main.swift
//  201104_week1_Practice
//
//  Created by 조중윤 on 2020/11/04.
//

import Foundation

//MARK: - 미션1. printXY()

func printXY(max: Int) {
    let myArray: Array<Int> = Array(1...max)
    for _ in 1...max {
        for i in 0..<max {
            print(myArray[i], terminator: " ")
        }
        print("\n")
    }
    print("----------")
}

printXY(max: 3)
printXY(max: 5)
//MARK: - 미션2. printLeftTree()

func printLeftTree(lines: Int) {
    for i in 1...lines {
        for j in 1...lines {
            if i >= j {
                print("🎈", terminator: " ")
            }
        }
        print("\n")
    }
    print("----------")
}

printLeftTree(lines: 5)

//MARK: -  미션3. printRightTree()

func printRightTree(lines : Int) {
    for i in 1...lines {
        var j = 5

        repeat {
            if i >= j {
                print("🎈", terminator: " ")
            } else {
                print(" ", terminator: " ")
            }

            j -= 1
        } while (j >= 1)
        print("\n")
    }
    print("----------")
}

printRightTree(lines: 3)

//MARK: - 미션4. printCenterTree() -- 다시 풀어보기

//func printCenterTree(lines : Int) {
//    for i in 1...lines {
//        if i % 2 == 1 {
//            for j in 1...lines * 2 - 1 {
//                if j % 2 == 0 {
//                    print(" ")
//                } else if j % 2 == 1 && j == lines / 2 + 1 {
//                    print("🎈 ")
//                } else {
//                    print (" ")
//                }
//            }
//        } else if (i % 2 == 0) {
//
//        }
//    }
//}
//printCenterTree(lines: 5)

//MARK: - 미션5. printNumbers() {

func printNumbers(lines: Int) {
    var k:Int = 0
    for i in 0...lines - 1 {
        for _ in 0...i {
            print("\(k+1)", terminator: " ")
            k += 1
        }
        print("\n")
    }
    print("----------")
}

printNumbers(lines: 5)

//MARK: - 미션5. printSquare()

func printSquare(columns : Int) {
    let lastNum: Int = 123234
    
    myForLoop: for number in 1...lastNum {
        if number > 25 {
            print("\n")
            break myForLoop
        } else if number % columns == 0 {
            print(number, terminator: "\n")
        } else {
            print(number, terminator: " ")
        }
    }
    print("----------")
}

printSquare(columns: 3)

//MARK: - 미션5. printReverse()

func printReverse(lines : Int) {
    var k: Int = 0
    
    for i in 0...lines - 1 {
        if i % 2 == 0 {
            for _ in 0...lines - 1 {
                print("\(k+1)", terminator: " ")
                k += 1
            }
        } else {
            k += lines
            for j in 0...lines - 1 {
                print("\(k-j)", terminator: " ")
            }
        }
        print("\n")
    }
    print("----------")
}

printReverse(lines: 4)

//MARK: - printDiamond()

func printDiamond(max: Int) {
    var myInt1 = 0
    
    for i in stride(from: 0, to: max, by: 2) {
        for _ in myInt1..<max/2 {
            print(" ", terminator: "")
        }
        
        for _ in 0...i {
            print("*", terminator: "")
        }
        print("\n")
        
        myInt1 += 1
    }
    for i in stride(from: 2, to: max, by: 2) {
        for _ in 0..<i/2 {
            print(" ", terminator: "")
        }
        for _ in i..<max {
            print("*", terminator: "")
        }
        print("\n")
    }
    print("----------")
}

printDiamond(max: 7)

//MARK: - print3515()

func clap369(lines: Int) -> Array<String> {
    var myArray: Array<String> = []
    for i in 1...lines {
        if (i % 15 == 0) {
            myArray.append("👏🏼🙏")
        } else if (i % 3 == 0) {
            myArray.append("👏🏼")
        } else if (i % 5 == 0) {
            myArray.append("🙏")
        } else {
            myArray.append(String(i))
        }
    }
    return myArray
}

print(clap369(lines: 15))
