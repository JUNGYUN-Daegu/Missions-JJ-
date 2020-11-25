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
//MARK:- Additional Missions
func sortFiles() -> [String] {
    var contentOfDirectory: Array<String> = []
    let documentDirectory = fileManager.urls(
        for: .desktopDirectory,
        in: .userDomainMask)[0]
    var fileURLs: [URL] = []
    
    do {
        fileURLs = try fileManager.contentsOfDirectory(
            at: documentDirectory,
            includingPropertiesForKeys: nil,
            options: [.skipsSubdirectoryDescendants, .skipsHiddenFiles]
        )
    } catch {
        print("Error retrieving URLs")
    }
    //file URL to String
    for url in fileURLs {
        // url.path: turing URL address into String, if you use absoluteString method, you will get extended string
        // lastPathComponent: retrieving file name here
        let temp: String = (url.path as NSString).lastPathComponent
        contentOfDirectory.append(temp)
    }
    return contentOfDirectory.sorted()
}



