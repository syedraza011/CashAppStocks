//
//  SimilarPriceRangeView.swift
//  CashAppStocks
//
//  Created by Syed Raza on 7/10/23.
//

import Foundation
//
//class SimilarPriceRangeView: ObservableObject {
//    @Published var relatedItems: [StockData] = []
//    private let stockService: StockService = StockService()
//
//    func getRelatedItemsFromParent(_ parentStock: Stock) {
//        var relatedItems: Set<String> = []
//        for price in parentStock.current_price_cents {
//            guard let prices = price else {
//                continue
//            }
//            for price in prices {
//                relatedItems.insert(price.current_price_cents)
//            }
//        }
//        relatedItems.remove(parentStock.id)
//        for relatedItem in relatedItems {
//            if let item = stockService.fetchStocks(relatedItem) {
//                self.relatedItems.append(StockData(rawData: item))
//            }
//        }
//    }
//}
