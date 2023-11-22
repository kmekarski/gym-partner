//
//  HomeView.swift
//  GymPartner
//
//  Created by Klaudiusz Mękarski on 20/11/2023.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var vm: RootViewModel
    @State var authViewType: AuthViewType = .signIn

    var body: some View {
        ZStack {
            if authViewType == .none {
                HomeView(authViewType: $authViewType)
            } else {
                AuthView(authViewType: $authViewType)
            }
        }
        .onAppear {
            let authUser = try? vm.authManager.getAuthenticatedUser()
            self.authViewType = authUser == nil ? .signIn : .none
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
            .environmentObject(dev.rootViewModel)
            .environmentObject(dev.homeViewModel)
            .environmentObject(dev.settingsViewModel)
    }
}
