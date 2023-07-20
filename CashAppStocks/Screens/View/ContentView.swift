//
//  ContentView.swift
//  CashAppStocks
//
//  Created by Syed Raza on 7/10/23.
//
//
import SwiftUI
import Combine

enum SortOption {
    case name
    case ticker
    case current_price_cents
}

struct ContentView: View {
    @StateObject var viewModel = StocksViewModel()

    var body: some View {
        NavigationView {
            VStack {
                switch viewModel.state {
                case .initial:
                    Text("Displaying the Stocks")
                case .loading:
                    Text("Loading...")
                case .loaded:
                    stockListView()
                case .error:
                    Text("Sorry! something went wrong..")
                }
            }
            .font(.body).bold()
        }
        .onAppear {
            self.viewModel.getStocks()
        }
    }

    private func stockListView() -> some View {
        VStack {
            Text("Cash App Stocks")
                .font(.system(size: 35))
                .bold()
                .foregroundColor(.white)
                .padding(.top, 20)

            ForEach(viewModel.fullStocks.stocks, id: \.self) { stock in
                VStack {
                    HStack {
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

                        VStack {
                            Text(formatPriceCents(stock.current_price_cents))
                                .font(.subheadline)
                                .foregroundColor(.white)
                                .padding(.horizontal)

                            Text(formatTimestamp(stock.current_price_cents))
                                .font(.subheadline)
                                .foregroundColor(.white)
                                .padding(.horizontal)

                        }
                        .frame(width: 210, height: 130)

                    }
                    .padding(.vertical, 10)
                }
                .frame(width: 370, height: 120)
                .background(Color.black)
                .cornerRadius(16)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.white, lineWidth: 3)
                )
                .padding(.vertical, 20)
            }
        }
    }
    func formatTimestamp(_ timestamp: Int) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(timestamp))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let formattedDate = dateFormatter.string(from: date)
        return formattedDate
    }
    func formatPriceCents(_ priceCents: Int) -> String {
        let formattedPrice = String(format: "$%.2f", Double(priceCents) / 100)
        return formattedPrice
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
