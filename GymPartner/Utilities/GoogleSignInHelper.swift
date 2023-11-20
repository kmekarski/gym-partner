//
//  GoogleSignInHelper.swift
//  GymPartner
//
//  Created by Klaudiusz Mękarski on 21/11/2023.
//

import Foundation
import GoogleSignIn
import GoogleSignInSwift

@MainActor
final class GoogleSignInHelper {
    func signIn() async throws -> GoogleSignInResult {
        guard let topVC = Utilites.shared.topViewController() else {
            throw URLError(.cannotFindHost)
        }
        
        let gidSignInResult = try await GIDSignIn.sharedInstance.signIn(withPresenting: topVC)
        
        guard let idToken: String = gidSignInResult.user.idToken?.tokenString else {
            throw URLError(.badServerResponse)
        }
        
        let accessToken: String = gidSignInResult.user.accessToken.tokenString
        
        return GoogleSignInResult(idToken: idToken, accessToken: accessToken)
    }
}
