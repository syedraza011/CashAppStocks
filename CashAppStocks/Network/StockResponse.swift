//
//  StockResponse.swift
//  CashAppStocks
//
//  Created by Syed Raza on 7/10/23.
//

//import Foundation
//struct StockResponse: Decodable {
//    let data : Stocks
//}
//struct Stocks: Decodable {
//    let Stocks: [Stock]
//}
//struct Stock: Decodable,Identifiable{
//    let id: UUID
//    let ticker : String
//    let name: String
//    let currency: String
//    let current_price_cents: Int
//    let quantity : Int
//    let current_price_timestamp: Int?
//    init(id: UUID, ticker: String, name: String, currency: String, current_price_cents: Int, quantity: Int, current_price_timestamp: Int?) {
//        self.id = id
//        self.ticker = ticker
//        self.name = name
//        self.currency = currency
//        self.current_price_cents = current_price_cents
//        self.quantity = quantity
//        self.current_price_timestamp = current_price_timestamp
//    }
//
//static let mock = Stock (id: 123, ticker: "^GSPC", name: "S&P 500", currency: "USD",
//                             current_price_cents: 318157, quantity: 5, current_price_timestamp: 1681845832)
//
//}

import Foundation

struct StockResponse: Decodable {
    let data: Stocks
}

struct Stocks: Decodable {
    let stocks: [Stock]
}

struct Stock: Decodable, Identifiable {
    let id: UUID
    let ticker: String
    let name: String
    let currency: String
    let current_price_cents: Int
    let quantity: Int
    let current_price_timestamp: Int?
    
    init(id: UUID, ticker: String, name: String, currency: String, current_price_cents: Int, quantity: Int, current_price_timestamp: Int?) {
        self.id = id
        self.ticker = ticker
        self.name = name
        self.currency = currency
        self.current_price_cents = current_price_cents
        self.quantity = quantity
        self.current_price_timestamp = current_price_timestamp
    }
}

let mock = Stock(id: UUID(), ticker: "^GSPC", name: "S&P 500", currency: "USD", current_price_cents: 318157, quantity: 5, current_price_timestamp: 1681845832)
