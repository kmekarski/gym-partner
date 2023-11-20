//
//  AuthViewModel.swift
//  GymPartner
//
//  Created by Klaudiusz Mękarski on 20/11/2023.
//

import Foundation
import GoogleSignIn
import GoogleSignInSwift

@MainActor
final class AuthViewModel: ObservableObject {
    func signInGoogle() async throws{
        let helper = GoogleSignInHelper()
        let tokens = try await helper.signIn()
        try await AuthManager.shared.signInWithGoogle(tokens: tokens)
    }
}
