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
    let authViewModel: AuthViewModel
    let signInEmailViewModel: SignInEmailViewModel
    let rootViewModel: RootViewModel
    let homeViewModel: HomeViewModel
    let settingsViewModel: SettingsViewModel
    
    private init() {
        authManager = ManagersProvider.provideAuthManager()
        rootViewModel = RootViewModel(authManager: authManager)
        homeViewModel = HomeViewModel(authManager: authManager)
        authViewModel = AuthViewModel(authManager: authManager)
        signInEmailViewModel = SignInEmailViewModel(authManager: authManager)
        settingsViewModel = SettingsViewModel(authManager: authManager)
    }
    
}
