//
//  StcokService.swift
//  CashAppStocks
//
//  Created by Syed Raza on 7/10/23.
//

import Foundation
class StockService {
    func fetchStocks() throws -> [Stock] {
        guard let url = URL(string: "https://storage.googleapis.com/cash-homework/cash-stocks-api/portfolio.json") else {
            print("Invalid URL")
            return
        }
        do {
            let data =  try Data (contentsOf: url)
            let result = try JSONDecoder().decode(StockResponse.self, from data)
            return result.data.stocks
        }
    }
}
