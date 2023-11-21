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
    
    init(authManager: AuthManager) {
        self.authManager = authManager
    }
    
    func signInGoogle() async throws{
        let helper = await GoogleSignInHelper()
        let tokens = try await helper.signIn()
        let authData = try await authManager.signInWithGoogle(tokens: tokens)
        try UserManager.shared.createNewUser(user: DBUser(auth: authData))
    }
}
