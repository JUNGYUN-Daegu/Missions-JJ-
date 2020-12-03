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

//"title": "명동충무<b>김밥</b>",
// "link": "http://www.leemeefood.com/",
// "category": "음식점>분식",
// "description": "",
// "telephone": "",
// "address": "서울특별시 중구 명동2가 33-4",
// "roadAddress": "서울특별시 중구 명동10길 8",
// "mapx": "310531",
// "mapy": "551731"
