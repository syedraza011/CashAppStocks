//
//  TopBarView.swift
//  FacebookMenuPage
//
//  Created by Ajinkya Mate on 7/18/23.
//

import SwiftUI

struct TopBarView: View {
    var body: some View {
        HStack {
            Text("Menu")
                .font(.headline)
                .padding()
            
            Spacer()
            ZStack {
                Circle()
                    .foregroundColor(Color(red: 0.8, green: 0.8, blue: 0.8))
                    .frame(width: 35, height: 35)
                Image(systemName: "gearshape.fill")
                    .resizable()
                    .frame(width: 20, height: 20)
            }
            
            ZStack {
                Circle()
                    .foregroundColor(Color(red: 0.8, green: 0.8, blue: 0.8))
                    .frame(width: 35, height: 35)
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .padding(20)
            }
            
        }
    }
}

struct TopBarView_Previews: PreviewProvider {
    static var previews: some View {
        TopBarView()
    }
}
