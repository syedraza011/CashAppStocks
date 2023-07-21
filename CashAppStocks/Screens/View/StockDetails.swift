//
//  StockDetails.swift
//  CashAppStocks
//
//  Created by Syed Raza on 7/20/23.
//

import SwiftUI




import SwiftUI

struct StockDetails: View {
    let stocks: [Stock]


    var body: some View {


                VStack {

                    ForEach(stocks, id: \.self) { stock in
                        HStack {
                            VStack {
                                Text("\(stock.name)")
                                    .font(.system(size: 20))
                                    .foregroundColor(.white)
                                    .bold()
                                HStack{


                                    Text("\(stock.ticker)")
                                        .font(.system(size: 25))
                                        .bold()
                                        .foregroundColor(.white)
                                        .padding(.bottom, 5)
                                    Text(formatPriceCents(stock.current_price_cents))
                                        .font(.subheadline)
                                        .foregroundColor(.white)
                                        .padding(.horizontal)
                                        .bold()
                                }


                                Text(formatTimestamp(stock.current_price_timestamp))
                                    .font(.subheadline)
                                    .foregroundColor(.white)
                                    .padding(.horizontal)
                                    .bold()


                            }

                        }
                        .frame(width: 390, height: 420)
                        .background(Color.blue)
                        .cornerRadius(16)
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.white, lineWidth: 3)
                        )
//                        .padding(.vertical, 2)
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
                                quantity: 10,
                                current_price_timestamp: 1681845832)
        return StockDetails(stocks: [mockStock])
    }
}

