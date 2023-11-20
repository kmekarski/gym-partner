//
//  SettingsViewModel.swift
//  GymPartner
//
//  Created by Klaudiusz Mękarski on 20/11/2023.
//

import Foundation

@MainActor
final class SettingsViewModel: ObservableObject {
    func signOut() throws {
        try AuthManager.shared.signOut()
    }
    
    func resetPassword() async throws {
        let authUser = try AuthManager.shared.getAuthenticatedUser()
        
        guard let email = authUser.email else {
            throw URLError(.fileDoesNotExist)
        }
        
        try await AuthManager.shared.resetPassword(email: email)
    }
    
    func updateEmail() async throws {
        let email = "hello123@gmail.com"
        try await AuthManager.shared.updateEmail(newEmail: email)
    }
    
    func updatePassword() async throws {
        let password = "asdfghjkl"
        try await AuthManager.shared.updatePassword(newPassword: password)
    }

}
