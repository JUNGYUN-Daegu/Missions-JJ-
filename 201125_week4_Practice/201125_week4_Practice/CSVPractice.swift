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
    
    do {
        let filePath = try fileManager.contentsOfDirectory(at: desktopDirectory, includingPropertiesForKeys: .none, options: .skipsHiddenFiles)
    } catch {
        print ("error")
    }
    
    // it has been actually so easy to convert url into string. You just put url into parenthesis.
    let targetedFilePath = "\(desktopDirectory)csv.csv"
    print(targetedFilePath)

    // but this time, String method require me to put URl type argument. then how can I get speicific file's url?
    var content = String(contentsOf: targetedFilePath, encoding: .utf8)
    
}
