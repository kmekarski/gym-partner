//
//  AuthViewModel.swift
//  GymPartner
//
//  Created by Klaudiusz Mękarski on 20/11/2023.
//

import Foundation
import GoogleSignIn
import GoogleSignInSwift

final class AuthViewModel: ObservableObject {
    var authManager: AuthManager
    var userManager: UserManager
    
    init(authManager: AuthManager, userManager: UserManager) {
        self.authManager = authManager
        self.userManager = userManager
    }
    
    func signInGoogle() async throws {
        let helper = await GoogleSignInHelper()
        let tokens = try await helper.signIn()
        let authData = try await authManager.signInWithGoogle(tokens: tokens)
        try await userManager.createNewUser(user: DBUser(auth: authData))
    }
    
    func signInEmail(email: String, password: String) async throws {
        try await authManager.signIn(email: email, password: password)
    }
    
    func signUpEmail(username: String, email: String, password: String) async throws {
        let authData = try await authManager.createUser(email: email, password: password)
        let user = DBUser(auth: authData, username: username)
        try await userManager.createNewUser(user: user)
    }
    
    func getAuthenticatedUser() async throws -> DBUser {
        let authData = try authManager.getAuthenticatedUser()
        let user = try await userManager.getUser(userId: authData.uid)
        return user
    }
}
