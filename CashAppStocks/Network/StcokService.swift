//
//  StcokService.swift
//  CashAppStocks
//
//  Created by Syed Raza on 7/10/23.
//

import Foundation
import Combine
import Foundation

enum APIError: Error {
    case invalidURL(String)
    case invalidResponse
    case decodingError
}

class StockService {
    
    struct Constants {
        static let baseURL = "https://storage.googleapis.com/cash-homework/cash-stocks-api/portfolio.json"
//        static let baseURL = "https://storage.googleapis.com/cash-homework/cash-stocks-api/portfolio_empty.json"
    }

    func fetchStocks() async throws -> [Stock] {
        guard let url = URL(string: Constants.baseURL) else {
            throw APIError.invalidURL("Invalid URL")
        }
        
    do {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                throw APIError.invalidResponse
            }
            
            let result = try JSONDecoder().decode(StockResponse.self, from: data)
            return result.stocks
        } catch {
            throw APIError.decodingError
        }
    }
}
