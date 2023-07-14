//
//  ContentView.swift
//  CashAppStocks
//
//  Created by Syed Raza on 7/10/23.
//

import SwiftUI
import Combine


enum SortOption {
    case name
    case ticker
    case current_price_cents
}

struct ContentView: View {
    @StateObject var viewModel = StockViewModel()
    @State private var searchText = ""
    @State private var sortOption: SortOption = .name
   
    
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
                                        HStack{ Text(stock.name)
                                                .font(.headline)
                                                .foregroundColor(.white)
                                                .padding(.horizontal)
                                            Text(formatPriceCents(stock.current_price_cents))
                                                .font(.subheadline)
                                                .foregroundColor(.white)
                                                .padding(.horizontal)
                                        }
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
            .navigationTitle("New York Stock")
            .searchable(text: $searchText, prompt: "Search")
            .navigationBarItems(
                leading: homeButton,
                trailing: sortButton
            )
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
                .foregroundColor(.black)
        }
    }

    var sortButton: some View {
        Menu {
            Button(action: {
                sortOption = .name
            }) {
                Label("Sort by Name", systemImage: sortOption == .name ? "checkmark" : "")
            }
            Button(action: {
                sortOption = .ticker
            }) {
                Label("Sort by Ticker", systemImage: sortOption == .ticker ? "checkmark" : "")
            }
            Button(action: {
                sortOption = .current_price_cents
            }) {
                Label("Sort by Current Price", systemImage: sortOption == .current_price_cents ? "checkmark" : "")
            }
        } label: {
            Image(systemName: "arrow.up.arrow.down")
                .foregroundColor(.black)
        }
    }

    var filteredStocks: [Stock] {
        var filtered = viewModel.stocks
        if !searchText.isEmpty {
            filtered = filtered.filter { stock in
                stock.name.localizedCaseInsensitiveContains(searchText) ||
                    stock.currency.localizedCaseInsensitiveContains(searchText) ||
                    formatPriceCents(stock.current_price_cents).localizedCaseInsensitiveContains(searchText)
            }
        }

        switch sortOption {
        case .name:
            filtered.sort { $0.name < $1.name }
        case .ticker:
            filtered.sort { $0.ticker < $1.ticker }
        case .current_price_cents:
            filtered.sort { $0.current_price_cents < $1.current_price_cents }
        }

        return filtered
    }
}













