//
//  SearchManager.swift
//  201130_week5_FinalProject
//
//  Created by 조중윤 on 2020/12/03.
//

import UIKit
protocol SearchManagerDelegate {
    func didResultUpdate(searchManager: SearchManager, searchResult: ResultModel)
}

struct SearchManager {
    let clientID: String = "TC3tZ9qQKlekEg6UHgxl"
    let clientKey: String = "79lA49Ja5y"
    
    var delegate: SearchManagerDelegate?
    
    func fetchSearchData(foodName: String) {
        let urlString: String = "https://openapi.naver.com/v1/search/local.json?query=\(foodName)"
        performRequest(urlString)
    }
    
    func performRequest(_ urlString: String) {
        let encodedQuery: String = urlString.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!
        let queryURL: URL = URL(string: encodedQuery)!
        
        var requestURL = URLRequest(url: queryURL)
//        requestURL.addValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        requestURL.addValue(clientID, forHTTPHeaderField: "X-Naver-Client-Id:")
        requestURL.addValue(clientKey, forHTTPHeaderField: "X-Naver-Client-Secret:")
      
        let task = URLSession.shared.dataTask(with: requestURL) { (data, response, error) in
            guard error == nil else {print(error ?? ""); return}
            guard let safeData = data else {print("data not found"); return}
            
        if let result = self.parseJSON(data: safeData) {
                self.delegate?.didResultUpdate(searchManager: self, searchResult: result)
            }
        }
        task.resume()
    }
    
    func parseJSON(data: Data) -> ResultModel? {
        let jsonDecoder = JSONDecoder()
        do {
            let decodedData = try jsonDecoder.decode(SearchResult.self, from: data)
            let result = ResultModel(title: decodedData.items[0].title, roadAddress: decodedData.items[0].roadAddress)
            return result
        } catch {
            print(error)
            return nil
        }
    }    
}
