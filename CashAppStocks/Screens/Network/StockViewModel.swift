//
//  StockViewModel.swift
//  CashAppStocks
//
//  Created by Syed Raza on 7/10/23.
//


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
                // For fetching and then reformatting the stocks, throw errors here or elsewhere btw
                let myStocks: StockResponse = try await self.service.fetchStocks()
                if (myStocks.stocks.isEmpty) {throw APIError.emptyData}
                self.fullStocks = myStocks
                state = .loaded
                
            } catch {
                if let error = error as? APIError {
                    print(error.description)
                    state = .error
                    throw error
                  
                } else {
                    print(error)
                    state = .error
                    throw error
                   
                }
            }
        }
    }
    
 
}
