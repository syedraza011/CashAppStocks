//
//  StockViewModel.swift
//  CashAppStocks
//
//  Created by Syed Raza on 7/10/23.
//


//import Foundation
//import Combine

//class StocksViewModel: ObservableObject {
//
//    @Published var fullStocks = StockResponse(stocks: [Stock]())
//    @Published var relatedItems: [Stock] = []
//    @Published var state: AsyncState = .initial
//    let service: StocksServiceProtocol
//
//    init(service: StocksServiceProtocol = StocksService()) {
//        self.service = service
//    }
//
//    @MainActor func getStocks() {
//        state = .loading
//        Task {
//            do {
//                // For fetching and then reformatting the stocks, throw errors here or elsewhere btw
//                let myStocks: StockResponse = try await self.service.fetchStocks()
//                if (myStocks.stocks.isEmpty) {throw APIError.emptyData}
//                self.fullStocks = myStocks
//                state = .loaded
//
//            } catch {
//                if let error = error as? APIError {
//                    print(error.description)
//                    state = .error
//                    throw error
//
//                } else {
//                    print(error)
//                    state = .error
//                    throw error
//
//                }
//            }
//        }
//    }
//
//}

import Foundation
import Combine

class StocksViewModel: ObservableObject {
    @Published var fullStocks = StockResponse(stocks: [Stock]())
    @Published var state: AsyncState = .initial
    let service: StocksServiceProtocol
    
    init(service: StocksServiceProtocol = StocksService()) {
        self.service = service
    }
    
    @MainActor func getStocks() {
        state = .loading
        Task {
            do {
                let myStocks: StockResponse = try await self.service.fetchStocks()
                if myStocks.stocks.isEmpty {
                    throw APIError.emptyData
                }
                self.fullStocks = myStocks
                state = .loaded
            } catch {
                if let error = error as? APIError {
                    print(error.description)
                } else {
                    print(error)
                }
                state = .error
            }
        }
    }
    
// 
//        
//        func getRelatedItemsFromParent(parentStock: Stock) -> [realtedStockData] {
//            var relatedItems: Set<Int> = []
//            for prices in parentStock.current_price_cents {
//                guard let prices = prices else {
//                    continue
//                }
//                for price in prices {
//                    relatedItems.insert(price)
//                }
//            }
//            relatedItems.remove(parentStock.id)
//            
//            var relatedStockData: [StockData] = []
//            for relatedItem in relatedItems {
//                if let item = try? await self.service.fetchStocks(relatedItem) {
//                    // Assuming StockData is the right type here, you may need to adjust this accordingly
//                    relatedStockData.append(StockData(rawData: item))
//                }
//            }
//            return relatedStockData
//        }
    

}
