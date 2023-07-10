//
//  ContentView.swift
//  CashAppStocks
//
//  Created by Syed Raza on 7/10/23.
//

import SwiftUI
import Combine
struct ContentView: View {
    @StateObject var viewModel = StockViewModel()
    
    var body: some View {
        Group {
            if viewModel.stocks.isEmpty {
                ProgressView()
            } else {
                List(viewModel.stocks) { stock in
                    VStack {
                        Text(stock.ticker)
                        Text(stock.currency)
                        Text(stock.name)
                        Text(String(stock.current_price_cents))
                        Text(String(stock.current_price_timestamp))
                    }
                }
            }
        }
        .onAppear {
            viewModel.getStocks()
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

