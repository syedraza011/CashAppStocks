//
//  ProfileCellView.swift
//  FacebookMenuPage
//
//  Created by Ajinkya Mate on 7/19/23.
//

import SwiftUI

struct ProfileCellView: View {
    var body: some View {
        VStack {
            HStack {
                Label("Your account", systemImage: "person.crop.circle")
                    .font(.title2)
                Spacer()
                ZStack {
                    Circle()
                        .foregroundColor(Color(red: 0.8, green: 0.8, blue: 0.8))
                        .frame(width: 28, height: 28)
                    Image(systemName: "chevron.down")
                        .bold()
                }
            }
            Divider()
//            HStack {
//                Label("Create another profile", systemImage: "plus.circle.fill")
//                    .font(.title2)
//                    .foregroundColor(.gray)
//                Spacer()
//                Circle()
//                    .foregroundColor(.white)
//                    .frame(width: 35, height: 35)
//            }
            
        }
        .padding()
    }
}

struct ProfileCellView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileCellView()
    }
}
