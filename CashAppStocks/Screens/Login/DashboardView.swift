//
//  DashForUser.swift
//  CashAppStocks
//
//  Created by Syed Raza on 8/26/23.
//
import SwiftUI


struct DashboardView: View {
    @State private var isMenuOpen = false
    
    var body: some View {
        ZStack {
            if isMenuOpen {
                SideMenuView(isMenuOpen: $isMenuOpen)
            } else {
                VStack(alignment: .leading, spacing: 20) {
                    HStack {
                        Button(action: {
                            isMenuOpen.toggle()
                        }) {
                            Image(systemName: "line.horizontal.3")
                                .font(.title)
                                .foregroundColor(.blue)
                        }
                        .padding(.leading, 20)
                        
                        Text("Dashboard")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.blue)
                            .padding(.top, 20)
                        
                        Spacer()
                    }
                    
                    Divider()
                    
                    HStack(spacing: 20) {
                        DashboardMetricView(title: "Total Portfolio Value", value: "$250,000", color: .blue)
                        DashboardMetricView(title: "Today's Gain/Loss", value: "+ $1,200", color: .green)
                    }
                    .padding(.horizontal)
                    
                    Divider()
                    
                    Text("Your Watchlist")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                        .padding(.top, 20)
                    
                    ScrollView {
                        ForEach(0..<5, id: \.self) { _ in
                            WatchlistItemView()
                                .padding(.horizontal)
                        }
                    }
                    
                    Spacer()
                    
                    Text("© 2023 Stock App")
                        .foregroundColor(.white)
                        .padding(.bottom, 10)
                        .background(.black)
                }
                .background(Color(.systemBackground))
            }
        }
    }
}

struct SideMenuView: View {
    @Binding var isMenuOpen: Bool
    
    var body: some View {
        Color.gray
            .edgesIgnoringSafeArea(.all)
            .onTapGesture {
                withAnimation {
                    isMenuOpen.toggle()
                    
                    if isMenuOpen {
                    MainMenuContentView() // Call the function when the menu is opened
                    }
                }
            }
    }
}

struct DashboardMetricView: View {
    var title: String
    var value: String
    var color: Color
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .font(.headline)
                .foregroundColor(.gray)
            
            Text(value)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(color)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 3)
    }
}

struct WatchlistItemView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 6) {
                Text("Apple Inc.")
                    .font(.headline)
                
                Text("AAPL")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
            VStack {
                Text("$150.25")
                    .font(.subheadline)
                Text("+2.75")
                    .font(.subheadline)
                    .foregroundColor(.green)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 3)
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}

