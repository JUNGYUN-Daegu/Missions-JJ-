//
//  CSVPractice.swift
//  201125_week4_Practice
//
//  Created by 조중윤 on 2020/12/16.
//

import Foundation

func readDataFromCSV() {
    let desktopDirectory = fileManager.urls(for: .desktopDirectory, in: .userDomainMask)[0]
    
//    do {
//        let filePath = try fileManager.contentsOfDirectory(at: desktopDirectory, includingPropertiesForKeys: .none, options: .skipsHiddenFiles)
//    } catch {
//        print ("error")
//    }
    
    // appendingPathComponent 기억하기: URL에 path component 추가
    let targetedFilePath = desktopDirectory.appendingPathComponent("csv.csv")
    
    do {
        let contents = try String(contentsOf: targetedFilePath, encoding: .utf8)
        readingCSV(with: contents)
        } catch {
        /* error handling here */
        }
}

func readingCSV(with contents: String) {
    var result: Array<Dictionary<String, String>> = []
    var rowsInContents: Array<Substring> = contents.split(separator: "\n")
    let attributes: Array<String> = rowsInContents.removeFirst().split(separator: ",").map { (Substring) -> String in
        Substring.trimmingCharacters(in: .whitespaces)
    }
    
    for row in rowsInContents {
        let elementsInRow = row.split(separator: ",").map { (element) -> String in
            element.trimmingCharacters(in: .whitespaces)
        }
        var tempDictionary: Dictionary<String, String> = [:]
        for (index, element) in elementsInRow.enumerated() {
            tempDictionary[String(attributes[index])] = element
        }
        result.append(tempDictionary)
    }
    
    for dictionary in result {
        print(dictionary, terminator: "\n")
    }
}

