//
//  MenuPageCellsView.swift
//  FacebookUI
//
//  Created by Joshua Ho on 6/29/23.
//

import SwiftUI

// MenuPageCells can be called to display supporting page cells for the menu page
// Takes a string parameter "cellType" that must be of value "shortcuts", "help", or "settings".
// Pass argument based on which dropdown menu you are using
// You can modify colors or padding by changing the values in the private functions below. If using different background Color simply delete that attribute in the private functions
enum CellType{
    case shortcuts
    case help
    case settings
}
struct MenuPageCellsView: View {
    let cellType: CellType
    @State var seeMore = false //State variable for shortcuts seeMore button
    
    var body: some View {
        switch cellType {
        case .shortcuts:
            let columns : [GridItem] = [
                GridItem(.adaptive(minimum: 200), alignment: .leading),
                GridItem(.adaptive(minimum: 150), alignment: .leading),
            ]
            shortcutsView(columns: columns)
        case .help:
            let columns : [GridItem] = [
                GridItem(.adaptive(minimum: .infinity))
            ]
            helpAndSupportView(columns: columns)
        case .settings:
            let columns : [GridItem] = [
                GridItem(.adaptive(minimum: .infinity))
            ]
            settingsAndPrivacyView(columns: columns)
        }
    }
    
    
    // Helper function to display cells for shortcuts
    private func shortcutsView(columns: [GridItem]) -> some View {
        VStack {
            LazyVGrid(columns: columns) {
                ForEach(seeMore == true ? MenuCell.shortcutsData : Array(MenuCell.shortcutsData.prefix(14))) { shortcut in
                    VStack {
                        NavigationLink(destination: Text(shortcut.title)) { //replace destination with the associated page once created
                            VStack(alignment: .leading, spacing: 7) {
                                Image(systemName: shortcut.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(.blue)
                                Text(shortcut.title)
                                   
                            }
                            .multilineTextAlignment(.leading)
                            
                            Spacer()
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.white) //Change color here
                    .cornerRadius(10)
                    .foregroundColor(.primary)
                }
            }
            .padding()
            
            Button {
                seeMore.toggle()
            } label: {
                Text(seeMore ? "See Less" : "See More")
                    .bold()
                    .foregroundColor(.black)
                    .padding()
            }
            .frame(maxWidth: .infinity)
            .background(Color(.systemGray5))
            .cornerRadius(10)
            .padding([.horizontal, .bottom])
        }
        .background(Color(.systemGray6))
    }
    
    // Helper function to display cells for help and support tab
    private func helpAndSupportView(columns: [GridItem]) -> some View {
        NavigationView {
            VStack {
                LazyVGrid(columns: columns) {
                    ForEach(MenuCell.helpAndSupportData) { cell in
                        VStack {
                            NavigationLink(destination: Text(cell.title)) { //replace destination with the associated page once created
                                HStack {
                                    Image(systemName: cell.image)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 20, height: 20)
                                        .foregroundColor(Color("menuCellIconGray"))
                                    Text(cell.title)
                                }
                                Spacer()
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.white) //Change color here
                        .cornerRadius(10)
                        .foregroundColor(.primary)
                    }
                }
            }
            .padding(3)
            .background(Color(.systemGray6))
        }
    }
    
    // Helper function to display cells for settings and privacy tab
    private func settingsAndPrivacyView(columns: [GridItem]) -> some View {
        NavigationView {
            VStack {
                LazyVGrid(columns: columns) {
                    ForEach(MenuCell.settingsAndPrivacyData) { cell in
                        VStack {
                            NavigationLink(destination: Text(cell.title)) { //replace destination with the associated page once created
                                HStack {
                                    Image(systemName: cell.image)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 20, height: 20)
                                        .foregroundColor(Color("menuCellIconGray"))
                                    Text(cell.title)
                                }
                                Spacer()
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.white) //Change color here
                        .cornerRadius(10)
                        .foregroundColor(.primary)
                    }
                }
            }
            .padding(3)
            .background(Color(.systemGray6))
        }
    }
}

struct MenuPageCellsView_Previews: PreviewProvider {
    static var previews: some View {
        MenuPageCellsView(cellType: .help)
    }
}
