//
//  SubMenuPageCellView.swift
//  FacebookUI
//
//  Created by Jack Liu on 7/27/23.
//

import SwiftUI

struct SubMenuPageCellView: View {
    @State private var setting = false
    @State private var help = false
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "questionmark.circle.fill")
                    .scaledToFit()
                    .frame(width: 30, height:30)
                Text("Help & support")
                Spacer()
                Image(systemName: help ? "chevron.up": "chevron.down")
            }
            .padding()
            .onTapGesture {
                help.toggle()
            }
            if help{
                MenuPageCellsView(cellType: .help)
                    .frame(width: 380,height: 320)
            }
            HStack{
                Image(systemName: "gearshape.fill")
                    .scaledToFit()
                    .frame(width: 30, height:30)
                Text("Setting & privacy")
                Spacer()
                Image(systemName: setting ? "chevron.up": "chevron.down")
            }
            .padding()
            .onTapGesture {
                setting.toggle()
            }
            if setting{
                MenuPageCellsView(cellType: .settings)
                    .frame(width: 380,height: 270)
            }
        }
    }
}


