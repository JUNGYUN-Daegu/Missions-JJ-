//
//  pathFinder.swift
//  201125_week4_Practice
//
//  Created by 조중윤 on 2020/11/25.
//

import Foundation

let fileManager = FileManager.default

func files(at path: String) -> Array<String> {
    var resultArray: Array<String> = []
    
    do {
        resultArray = try fileManager.contentsOfDirectory(atPath: path)
    } catch {
        print("Error occured")
    }
    return resultArray
}

func isExist(fileName: String, at path: String) -> Bool {
    var contentOfDirectory: Array<String> = []
    var result = false
    
    do {
        contentOfDirectory = try fileManager.contentsOfDirectory(atPath: path)
    } catch {
        print("Error occured")
    }
    
    for item in contentOfDirectory {
        if item == fileName {
            result = true
        }
    }
    return result
}





