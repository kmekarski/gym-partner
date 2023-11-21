//
//  GymPartnerApp.swift
//  GymPartner
//
//  Created by Klaudiusz Mękarski on 20/11/2023.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct GymPartnerApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    let authManager: AuthManager
    let authViewModel: AuthViewModel
    let signInEmailViewModel: SignInEmailViewModel
    let rootViewModel: RootViewModel
    let homeViewModel: HomeViewModel
    let settingsViewModel: SettingsViewModel
    
     init() {
        authManager = ManagersProvider.provideAuthManager()
        rootViewModel = RootViewModel(authManager: authManager)
        homeViewModel = HomeViewModel(authManager: authManager)
        authViewModel = AuthViewModel(authManager: authManager)
        signInEmailViewModel = SignInEmailViewModel(authManager: authManager)
        settingsViewModel = SettingsViewModel(authManager: authManager)
    }
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(homeViewModel)
                .environmentObject(rootViewModel)
                .environmentObject(authViewModel)
                .environmentObject(signInEmailViewModel)
                .environmentObject(settingsViewModel)
        }
    }
}
