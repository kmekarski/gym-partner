//
//  HomeView.swift
//  GymPartner
//
//  Created by Klaudiusz Mękarski on 20/11/2023.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var vm: HomeViewModel
    @Binding var showSignInView: Bool
    @State var showSettings: Bool = false
    @State var user: AuthUser?
    var body: some View {
        ZStack {
            VStack {
                if let user = try? vm.authManager.getAuthenticatedUser() {
                    Text("hello \(user.name ?? "user")")
                }
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
            .environmentObject(dev.homeViewModel)
    }
}
