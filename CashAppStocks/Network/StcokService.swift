//
//  StcokService.swift
//  CashAppStocks
//
//  Created by Syed Raza on 7/10/23.
//


import Foundation
import Combine

enum APIError: Error {
    case invalidUrl
    case decodingError
}


class StockService {
    func fetchStocks() throws -> [Stock] {
        guard let url = Bundle(for: type(of: self)).url(forResource: "StockDataJson", withExtension: "json") else {
            throw APIError.invalidUrl
        }
        do {
            let data =  try Data (contentsOf: url)
            let result = try JSONDecoder().decode(StockResponse.self, from: data)
           return result.data.stocks
        } catch {
            throw APIError.decodingError
        }
    }
}
