//
//  ContentView.swift
//  CashAppStocks
//
//  Created by Syed Raza on 7/10/23.
//import SwiftUI
//import Combine

import SwiftUI
import Combine

enum SortOption {
    case name
    case ticker
    case current_price_cents
    case current_price_timestamp
}

struct ContentView: View {
    @ObservedObject var viewModel = StocksViewModel()
    @State private var sortOption: SortOption = .name // Default sort option
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Picker("Sort By", selection: $sortOption) {
                    Text("Name").tag(SortOption.name)
                    Text("Ticker").tag(SortOption.ticker)
                    Text("Price").tag(SortOption.current_price_cents)
                    Text("Timestamp").tag(SortOption.current_price_timestamp)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal)
                
                SearchBar(text: $searchText) // Add the search bar
                
                switch viewModel.state {
                case .initial:
                    Text("Displaying the Stocks")
                case .loading:
                    Text("Loading...")
                case .loaded:
                    stockListView(stocks: viewModel.fullStocks.stocks) // Pass the array of stocks here
                case .error:
                    Text("Sorry! Something went wrong..")
                }
            }
            .font(.body).bold()
        }
        .onAppear {
            self.viewModel.getStocks()
        }
    }
    
    private func stockListView(stocks: [Stock]) -> some View {
        let sortedStocks: [Stock]
        switch sortOption {
        case .name:
            sortedStocks = stocks.sorted { $0.name < $1.name }
        case .ticker:
            sortedStocks = stocks.sorted { $0.ticker < $1.ticker }
        case .current_price_cents:
            sortedStocks = stocks.sorted { $0.current_price_cents < $1.current_price_cents }
        case .current_price_timestamp:
            sortedStocks = stocks.sorted { $0.current_price_timestamp < $1.current_price_timestamp }
        }
        
        let filteredStocks = sortedStocks.filter { searchText.isEmpty ? true : $0.name.localizedCaseInsensitiveContains(searchText) }
        return ScrollView {
                VStack {
                    Text("New York Stocks")
                        .font(.system(size: 35))
                        .bold()
                        .foregroundColor(.white)
                        .padding(.top, 20)

                    ForEach(filteredStocks, id: \.self) { stock in
                        NavigationLink(destination: StockDetails(stocks: [stock])) {
                            VStack {
                                VStack {
                                    HStack {
                                        VStack {
                                            Text(formatPriceCents(stock.current_price_cents))
                                                .font(.subheadline)
                                                .foregroundColor(.white)
                                                .padding(.horizontal)
                                                .bold()
                                        }
                                        .frame(width: 210, height: 130)

                                        VStack {
                                            Text("\(stock.ticker)")
                                                .font(.system(size: 25))
                                                .bold()
                                                .foregroundColor(.white)
                                                .padding(.bottom, 5)

                                            Text("\(stock.name)")
                                                .font(.system(size: 14))
                                                .foregroundColor(.white)

                                        }
                                        .frame(width: 160, height: 100)
                                    }
                                    .padding(.vertical, 5)
                                }
                                .frame(width: 390, height: 120)
                                .background(Color.blue)
                                .cornerRadius(16)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 16)
                                        .stroke(Color.white, lineWidth: 3)
                                )
                                .padding(.vertical, 1)

                                if let quantity = stock.quantity, quantity > 0 {
                                    Text("Available to Buy")
                                        .font(.system(size: 14))
                                        .foregroundColor(.white)
                                        .padding(.horizontal, 8)
                                        .padding(.vertical, 4)
                                        .background(Color.green)
                                        .cornerRadius(10)
                                        .offset(x: -5, y: -40) // Adjust the offset to position the banner inside the card
                                } else {
                                    Text("Sold Out")
                                        .font(.system(size: 14))
                                        .foregroundColor(.white)
                                        .padding(.horizontal, 8)
                                        .padding(.vertical, 4)
                                        .background(Color.red)
                                        .cornerRadius(10)
                                        .offset(x: 00, y: -40) // Adjust the offset to position the banner inside the card
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("New York Stocks")
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
