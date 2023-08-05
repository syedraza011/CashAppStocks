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
    

}

//class StockViewModel: ObservableObject {
//@Published var allStock = StockResponse(stocks: [Stock]())
//    @Published state: AsyncState = .initial
//    let service = StocksServiceProtocol()
//    
//    init (service: StocksServiceProtocol = StocksService()){
//        self.service = service
//    }
//    @MainActor func getStocks(){
//        state = .loading
//        Task{
//            do{
//                let availableStocks: StockResponse = try await service.fetchStocks()
//                if availableStocks.stocks.isEmpty{
//                    throw APIError.emptyData
//                }
//                self.$allStock = availableStocks
//                state = .loaded
//            }
//        }
//    }
//    
//    
//}
