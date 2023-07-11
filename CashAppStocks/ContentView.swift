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
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            VStack {
                if viewModel.stocks.isEmpty {
                    ProgressView()
                } else {
                    ScrollView {
                        LazyVGrid(columns: [GridItem(.adaptive(minimum: 200), spacing: 16)], spacing: 16) {
                            ForEach(filteredStocks) { stock in
                                NavigationLink(destination: StockDetailsView(stock: stock)) {
                                    VStack(alignment: .leading, spacing: 10) {
                                        Text(stock.name)
                                            .font(.headline)
                                            .foregroundColor(.white)
                                            .padding(.horizontal)
                                        Text(formatPriceCents(stock.current_price_cents))
                                            .font(.subheadline)
                                            .foregroundColor(.white)
                                            .padding(.horizontal)
                                        Text(formatTimestamp(stock.current_price_timestamp))
                                            .font(.subheadline)
                                            .foregroundColor(.white)
                                            .padding(.horizontal)
                                    }
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                                    .padding()
                                    .background(Color.blue)
                                    .cornerRadius(10)
                                }
                                .buttonStyle(PlainButtonStyle()) // Remove default button style
                            }
                        }
                        .padding()
                    }
                }
            }
            .navigationTitle("New York Stocks")
            .searchable(text: $searchText, prompt: "Search")
            .navigationBarItems(trailing: homeButton)
        }
        .onAppear {
            viewModel.getStocks()
        }
    }
    
    var homeButton: some View {
        Button(action: {
            // Handle home button action
        }) {
            Image(systemName: "house")
                .foregroundColor(.white)
        }
    }
    
    var filteredStocks: [Stock] {
        if searchText.isEmpty {
            return viewModel.stocks
        } else {
            return viewModel.stocks.filter { stock in
                stock.name.localizedCaseInsensitiveContains(searchText) ||
                    stock.currency.localizedCaseInsensitiveContains(searchText) ||
                    formatPriceCents(stock.current_price_cents).localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    func formatPriceCents(_ priceCents: Int) -> String {
        let formattedPrice = String(format: "$%.2f", Double(priceCents) / 100)
        return formattedPrice
    }
    
    func formatTimestamp(_ timestamp: Int) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(timestamp))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let formattedDate = dateFormatter.string(from: date)
        return formattedDate
    }
}





