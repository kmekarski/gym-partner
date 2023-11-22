//
//  PreviewProvider.swift
//  GymPartner
//
//  Created by Klaudiusz Mękarski on 21/11/2023.
//

import Foundation
import SwiftUI

extension PreviewProvider {
    static var dev: DeveloperPreview {
        DeveloperPreview.instance
    }
}

final class DeveloperPreview {
    static let instance = DeveloperPreview()
    
    let authManager: AuthManager
    let userManager: UserManager
    let exerciseManager: ExerciseManager
    let authViewModel: AuthViewModel
    let rootViewModel: RootViewModel
    let homeViewModel: HomeViewModel
    let settingsViewModel: SettingsViewModel
    let createPlanViewModel: CreatePlanViewModel
    
    private init() {
        authManager = ManagersProvider.provideAuthManager()
        userManager = ManagersProvider.provideUserManager()
        exerciseManager = ManagersProvider.provideExerciseManager()
        rootViewModel = RootViewModel(authManager: authManager)
        homeViewModel = HomeViewModel(authManager: authManager)
        authViewModel = AuthViewModel(authManager: authManager, userManager: userManager)
        settingsViewModel = SettingsViewModel(authManager: authManager)
        createPlanViewModel = CreatePlanViewModel(exerciseManager: exerciseManager)
    }
    
}
