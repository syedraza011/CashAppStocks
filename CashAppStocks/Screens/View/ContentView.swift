//
//  ContentView.swift
//  CashAppStocks
//
//  Created by Syed Raza on 7/10/23.

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
                SearchBar(text: $searchText) // Add the search bar
                Picker("Sort By", selection: $sortOption) {
                    Text("Name").tag(SortOption.name)
                    Text("Ticker").tag(SortOption.ticker)
                    Text("Price").tag(SortOption.current_price_cents)
                    Text("Timestamp").tag(SortOption.current_price_timestamp)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal)
                
               
                
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
           
        }
        .background(.black)
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
                                HStack{
                                    VStack(alignment: .leading) {
                                        Text(stock.ticker)
                                            .font(.headline)

                                    }
                                    Spacer()
                                    HStack{
                                        Text(stock.currency)
                                        Text("\(String(format: "%.2f", (Double(Double(stock.current_price_cents)/100))))")
                                            .font(.subheadline)
                                    }
                                    .frame(width: 120, height: 35, alignment: .center)
                                    .background(.green)
                                    .cornerRadius(10)
                                }
                                    Spacer()

                                .padding(.vertical, 1)
                                
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

