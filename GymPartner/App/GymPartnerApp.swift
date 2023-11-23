//
//  GymPartnerApp.swift
//  GymPartner
//
//  Created by Klaudiusz Mękarski on 20/11/2023.
//

import SwiftUI
import FirebaseCore

@main
struct GymPartnerApp: App {
    
    let authManager: AuthManager
    let userManager: UserManager
    let exerciseManager: ExerciseManager
    
    let authViewModel: AuthViewModel
    let rootViewModel: RootViewModel
    let homeViewModel: HomeViewModel
    let settingsViewModel: SettingsViewModel
    let createPlanViewModel: CreatePlanViewModel
    
    init() {
        FirebaseApp.configure()
        authManager = ManagersProvider.provideAuthManager()
        userManager = ManagersProvider.provideUserManager()
        exerciseManager = ManagersProvider.provideExerciseManager()
        rootViewModel = RootViewModel(authManager: authManager)
        homeViewModel = HomeViewModel()
        authViewModel = AuthViewModel(authManager: authManager, userManager: userManager)
        settingsViewModel = SettingsViewModel(authManager: authManager)
        createPlanViewModel = CreatePlanViewModel(exerciseManager: exerciseManager)
    }
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(homeViewModel)
                .environmentObject(rootViewModel)
                .environmentObject(authViewModel)
                .environmentObject(settingsViewModel)
                .environmentObject(createPlanViewModel)
        }
    }
}
