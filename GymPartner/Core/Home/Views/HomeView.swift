//
//  HomeView.swift
//  GymPartner
//
//  Created by Klaudiusz Mękarski on 20/11/2023.
//

import SwiftUI

struct HomeView: View {
    @Binding var showSignInView: Bool
    var body: some View {
        Text("Hello, user!")
        Button("logout") {
            Task {
                do {
                    try AuthManager.shared.signOut()
                    showSignInView = true
                }
                catch {
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(showSignInView: .constant(false))
    }
}
