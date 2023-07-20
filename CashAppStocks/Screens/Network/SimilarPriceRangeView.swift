//
//  SimilarPriceRangeView.swift
//  CashAppStocks
//
//  Created by Syed Raza on 7/10/23.
//

import Foundation
//
//class SimilarPriceRangeView: ObservableObject {
//    @EnvironmentObject var stockViewModel: StockViewModel
//    let stock: Stock
//    private let stockService: StockService = StockService() // Placeholder stock service instance
//
//    @Published var relatedItems: [Stock] = []
//
//    func getRelatedItemsFromParent(_ parentStock: Stock) {
//        var relatedItems: Set<String> = []
//        for price in parentStock.current_price_cents {
//            guard let prices = price else {
//                continue
//            }
//            for price in prices {
//                relatedItems.insert(price)
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


