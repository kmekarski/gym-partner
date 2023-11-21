//
//  HomeView.swift
//  GymPartner
//
//  Created by Klaudiusz Mękarski on 20/11/2023.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var vm: RootViewModel
    @State var showSignInView: Bool = false

    var body: some View {
        ZStack {
            if !showSignInView {
                HomeView(showSignInView: $showSignInView)
            } else {
                AuthView(showSignInView: $showSignInView)
            }
        }
        .onAppear {
            let authUser = try? vm.authManager.getAuthenticatedUser()
            self.showSignInView = authUser == nil
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
