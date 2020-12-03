//
//  SearchResult.swift
//  201130_week5_FinalProject
//
//  Created by 조중윤 on 2020/12/03.
//

import Foundation

class dataManager {
    static let shared: dataManager = dataManager()
    var searchResult: SearchResult?
    
    private init() {
    }
}

struct SearchResult: Codable {
    struct RestaurantInfo: Codable {
        let title: String
        let roadAddress: String
    }
    let items: [RestaurantInfo]
}
