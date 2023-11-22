//
//  HomeView.swift
//  GymPartner
//
//  Created by Klaudiusz Mękarski on 20/11/2023.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var vm: RootViewModel
    @State var showAuthView: Bool = false

    var body: some View {
        ZStack {
            if !showAuthView {
                HomeView(showAuthView: $showAuthView)
            } else {
                AuthView(showAuthView: $showAuthView)
            }
        }
        .onAppear {
            let authUser = try? vm.authManager.getAuthenticatedUser()
            self.showAuthView = authUser == nil
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
