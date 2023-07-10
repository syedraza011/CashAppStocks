//
//  StockViewModel.swift
//  CashAppStocks
//
//  Created by Syed Raza on 7/10/23.
//

import Foundation
class StockViewModel: ObservableObject{
    @Published var stocks: [Stock]=[]
    let service = StockService()
    
    func getStocks() {
        Task {
            do {
                let stocks = try await service.fetchStocks()
                DispatchQueue.main.async {
                    self.stocks = stocks
                }
            }catch {
                    print("error Fetching Stocks: \(error)")
                }
            }
        }
    
}
