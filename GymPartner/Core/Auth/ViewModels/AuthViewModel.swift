//
//  AuthViewModel.swift
//  GymPartner
//
//  Created by Klaudiusz Mękarski on 20/11/2023.
//

import Foundation
import GoogleSignIn
import GoogleSignInSwift
import FirebaseAuth

@MainActor
final class AuthViewModel: ObservableObject {
    func signInGoogle() async throws{
        guard let topVC = Utilites.shared.topViewController() else {
            throw URLError(.cannotFindHost)
        }
        
        let gidSignInResult = try await GIDSignIn.sharedInstance.signIn(withPresenting: topVC)
        
        guard let idToken: String = gidSignInResult.user.idToken?.tokenString else {
            throw URLError(.badServerResponse)
        }
        
        let accessToken: String = gidSignInResult.user.accessToken.tokenString
        
        let tokens = GoogleSignInResult(idToken: idToken, accessToken: accessToken)
        try await AuthManager.shared.signInWithGoogle(tokens: tokens)
    }
}
