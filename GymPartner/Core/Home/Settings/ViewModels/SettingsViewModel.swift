//
//  SettingsViewModel.swift
//  GymPartner
//
//  Created by Klaudiusz Mękarski on 20/11/2023.
//

import Foundation

final class SettingsViewModel: ObservableObject {
    
    @Published var authProviders: [AuthProviderOption] = []
    private var authManager: AuthManager
    
    init(authManager: AuthManager) {
        self.authManager = authManager
    }
    
    func loadAuthProviders() {
        if let providers = try? authManager.getProviders() {
            self.authProviders = providers
        }
    }
    
    func signOut() throws {
        try authManager.signOut()
    }
    
    func resetPassword() async throws {
        let authUser = try authManager.getAuthenticatedUser()
        
        guard let email = authUser.email else {
            throw URLError(.fileDoesNotExist)
        }
        
        try await authManager.resetPassword(email: email)
    }
    
    func updateEmail() async throws {
        let email = "hello123@gmail.com"
        try await authManager.updateEmail(newEmail: email)
    }
    
    func updatePassword() async throws {
        let password = "asdfghjkl"
        try await authManager.updatePassword(newPassword: password)
    }

}
