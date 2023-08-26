//
//  SignOut.swift
//  CashAppStocks
//
//  Created by Syed Raza on 8/26/23.
//

import SwiftUI

struct SignOut: View {
    @State private var isSignedIn = false
      
    var body: some View {
        VStack {
            if isSignedIn {
                Text("You are signed in.") // Display a message indicating signed in status
                    .font(.title)
                    .foregroundColor(.blue)
            } else {
                Text("You are signed out.") // Display a message indicating signed out status
//                SignIn()
                    .font(.title)
                    .foregroundColor(.red)
            }
            
            Button(action: {
                isSignedIn.toggle() // Simulate toggling sign-in/sign-out status
            }) {
                Text(isSignedIn ? "Sign Out" : "Sign In")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(isSignedIn ? Color.red : Color.blue)
                    .cornerRadius(8)
                    .shadow(radius: 3)
            }
            .padding(.top, 20)
        }
    }
}

struct SignOut_Previews: PreviewProvider {
    static var previews: some View {
        SignOut()
    }
}


