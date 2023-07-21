//
//  StockDetails.swift
//  CashAppStocks
//
//  Created by Syed Raza on 7/20/23.
//

import SwiftUI

struct StockDetails: View {
    let stocks: [Stock]

    var body: some View {
        NavigationView {
            VStack {
                ForEach(stocks, id: \.self) { individualStock in
                    VStack { // Place the stock.name here to make it topmost
                        Text(individualStock.name) // Stock name displayed at the top
                            .font(.system(size: 20))
                            .foregroundColor(.white)
                            .bold()
                        
                        Text("\(individualStock.ticker)")
                            .font(.system(size: 25))
                            .bold()
                            .foregroundColor(.white)
                            .padding(.bottom, 5)
                        
                        Text(formatPriceCents(individualStock.current_price_cents))
                            .font(.subheadline)
                            .foregroundColor(.white)
                            .padding(.horizontal)
                            .bold()
                        
                        Text(formatTimestamp(individualStock.current_price_timestamp))
                            .font(.subheadline)
                            .foregroundColor(.white)
                            .padding(.horizontal)
                            .bold()

                        Text("Stocks Availbility: \(individualStock.quantity ?? 0)")
                            .font(.system(size: 25))
                            .bold()
                            .padding(.bottom, 5)
                            .foregroundColor(individualStock.quantity == 0 ? .red : .white) // Conditional color

                    }
                    .frame(width: 390, height: 420)
                    .background(Color.blue)
                    .cornerRadius(16)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.white, lineWidth: 3)
                    )
                    .padding(.vertical, 2)
                }
            }
            .navigationBarTitle("New York Stocks")
        }
    }
}


struct StockDetails_Previews: PreviewProvider {
    static var previews: some View {
        let mockStock = Stock(ticker: "BAC",
                                name: "Bank of America Corporation",
                                currency: "USD",
                                current_price_cents: 2393,
                                quantity: 0,
                                current_price_timestamp: 1681845832)
        return StockDetails(stocks: [mockStock])
    }
}

