//
//  exercise6.swift
//  201109_week2_Practice
//
//  Created by 조중윤 on 2020/11/09.
//

import Foundation

func duplicatedWords(inputWords: Array<String>) -> Array<String> {
    var myDictionary: [String : Int] = [:]

    for word in inputWords {
        myDictionary[word] = myDictionary.keys.contains(word) ? myDictionary[word]! + 1 : 1
    }
    
    return Array(myDictionary.filter({ (key, value) -> Bool in
        value > 1
    }).keys)
    
    //BELOW is more simplified way to use the filter method.
    //return Array(myDictionary.filter { $0.value > 1}.keys)
    
    //or you can simply use Dictionary(grouping: ...) Initializer
}

