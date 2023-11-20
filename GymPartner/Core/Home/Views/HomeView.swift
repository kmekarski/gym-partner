//
//  HomeView.swift
//  GymPartner
//
//  Created by Klaudiusz Mękarski on 20/11/2023.
//

import SwiftUI

struct HomeView: View {
    @Binding var showSignInView: Bool
    @State var showSettings: Bool = false
    var body: some View {
        ZStack {
            VStack {
                Text("Hello, user!")
                Button("Settings") {
                    withAnimation(.spring()) {
                        showSettings = true
                    }
                }
            }
            if showSettings {
                SettingsView(showSignInView: $showSignInView, showSettings: $showSettings)
                    .transition(.move(edge: .leading))
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(showSignInView: .constant(false))
    }
}
