//
//  StockResponse.swift
//  CashAppStocks
//
//  Created by Syed Raza on 7/10/23.
//

import Foundation
struct StockResponse: Decodable {
    let data: Stocks
}
struct Stocks: Decodable {
    let Stocks: [Stock]
}
struct Stock: Decodable,Identifiable{
    let ticker : String
    let name: String
    let currency: String
    let current_price_cents: Int
    let quantity : Int
    let current_price_timestamp: Int
    
    static let mock = Stock (ticker: "^GSPC", name: "S&P 500", currency: "USD",
                             current_price_cents: 318157, quantity: 5, current_price_timestamp: 1681845832)
   
}
