//
//  CSVPractice.swift
//  201125_week4_Practice
//
//  Created by 조중윤 on 2020/12/16.
//

import Foundation

func readDataFromCSV() {
    let desktopDirectory = fileManager.urls(for: .desktopDirectory, in: .userDomainMask)[0]
    print(desktopDirectory)
    
//    do {
//        let filePath = try fileManager.contentsOfDirectory(at: desktopDirectory, includingPropertiesForKeys: .none, options: .skipsHiddenFiles)
//    } catch {
//        print ("error")
//    }
    
    // appendingPathComponent 기억하기: URL에 path component 추가
    let targetedFilePath = desktopDirectory.appendingPathComponent("csv.csv")
    print(targetedFilePath)
    
    do {
        let contents = try String(contentsOf: targetedFilePath, encoding: .utf8)
        print(contents)
        } catch {
        /* error handling here */
        }
}

