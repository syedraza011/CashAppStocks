//
//  ContentView.swift
//  FacebookMenuPage
//
//  Created by Ajinkya Mate on 6/30/23.
//

import SwiftUI

struct MainMenuContentView: View {
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 0) {
                TopBarView()
                
                Spacer()
                
                ProfileCellView()
                    .frame(width: 380, height: 120)
                    .background(.white)
                    .cornerRadius(10)
//
//                Text("Your shortcuts")
//                    .fontStyling(.title2)
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                    .padding()
                
//                YourShortcutsView()
                
                Text("All shortcuts")
                    .font(.title2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                MenuPageCellsView(cellType: .shortcuts)
                Divider()
                SubMenuPageCellView()
            }
        }
        .background(Color(.systemGray6))
    }
}

struct MainMenuContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuContentView()
    }
}
