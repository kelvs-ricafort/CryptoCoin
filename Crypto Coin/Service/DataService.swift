//
//  DataService.swift
//  Crypto Coin
//
//  Created by Kelvin on 6/17/24.
//

import Foundation

struct DataService {
    let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String
    
    func getCoinsList() async -> [Coin] {
        guard apiKey != nil else {
            return [Coin]()
        }
        
        let urlString = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd"
        if let url = URL(string: urlString) {
            var request = URLRequest(url: url)
            request.allHTTPHeaderFields = [
                "accept": "application/json",
                "x-cg-demo-api-key": apiKey!
            ]
            
            do {
                let (data, _) = try await URLSession.shared.data(for: request)
                let decoder = JSONDecoder()
                let coinList = try decoder.decode([Coin].self, from: data)
                return coinList
            } catch {
                print(error.localizedDescription)
            }
        }
        return [Coin]()
    }
}
