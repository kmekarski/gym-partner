//
//  AuthManager.swift
//  GymPartner
//
//  Created by Klaudiusz Mękarski on 20/11/2023.
//

import Foundation
import FirebaseAuth

final class AuthManager {
    
    static var shared = AuthManager()
    private init() {}
    
    func getAuthenticatedUser() throws -> AuthUser {
        guard let user = Auth.auth().currentUser else {
            throw URLError(.badServerResponse)
        }
        return AuthUser(user: user)
    }
    
    func signOut() throws {
        try Auth.auth().signOut()
    }
    
    func getProviders() throws -> [AuthProviderOption] {
        guard let providerData = Auth.auth().currentUser?.providerData else {
            throw URLError(.badServerResponse)
        }
        
        var providers: [AuthProviderOption] = []
        for provider in providerData {
            if let option = AuthProviderOption(rawValue: provider.providerID) {
                providers.append(option)
            } else {
                assertionFailure("Provider option not found: \(provider.providerID)")
            }
        }
        return providers
    }
    

}

// MARK: SIGN IN EMAIL

extension AuthManager {
    @discardableResult
    func createUser(email: String, password: String) async throws -> AuthUser {
        let authUser = try await Auth.auth().createUser(withEmail: email, password: password)
        return AuthUser(user: authUser.user)
    }
    @discardableResult
    func signIn(email: String, password: String) async throws -> AuthUser {
        let authUser = try await Auth.auth().signIn(withEmail: email, password: password)
        return AuthUser(user: authUser.user)
    }
    
    func resetPassword(email: String) async throws {
        try await Auth.auth().sendPasswordReset(withEmail: email)
    }
    
    func updatePassword(newPassword: String) async throws {
        guard let user = Auth.auth().currentUser else {
            throw URLError(.badServerResponse)
        }
        
        try await user.updatePassword(to: newPassword)
    }
    
    func updateEmail(newEmail: String) async throws {
        guard let user = Auth.auth().currentUser else {
            throw URLError(.badServerResponse)
        }
        
        try await user.updateEmail(to: newEmail)
    }
}


// MARK: SIGN IN SSO

extension AuthManager {
    
    @discardableResult
    func signInWithGoogle(tokens: GoogleSignInResult) async throws -> AuthUser {
        let authCredential = GoogleAuthProvider.credential(withIDToken: tokens.idToken, accessToken: tokens.accessToken)
        return try await signInWithCredential(authCredential: authCredential)
    }
    
    func signInWithCredential(authCredential: AuthCredential) async throws -> AuthUser {
        let authUser = try await Auth.auth().signIn(with: authCredential)
        return AuthUser(user: authUser.user)
    }
}
