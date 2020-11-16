//
//  ListManager.swift
//  Waiting List Management
//
//  Created by 조중윤 on 2020/11/16.
//

import Foundation

class ListManager {
    var peopleWaiting = 0
    
    func addPerson() {
        peopleWaiting += 1
    }
    func subtractPerson() {
        peopleWaiting -= 1
    }
}
