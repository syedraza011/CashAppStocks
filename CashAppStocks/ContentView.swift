//
//  ContentView.swift
//  CashAppStocks
//
//  Created by Syed Raza on 7/10/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = StockViewModel()
    var body: some View {
        if viewModel.stocks.isEmpty {
            ProgressView()
        } else {
            List(viewModel.stocks){ stock in
                VStack{
                    Text(stock.ticker)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
