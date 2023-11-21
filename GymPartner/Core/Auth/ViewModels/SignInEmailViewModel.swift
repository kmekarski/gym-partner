//
//  SignInEmailViewModel.swift
//  GymPartner
//
//  Created by Klaudiusz Mękarski on 21/11/2023.
//

import Foundation

final class SignInEmailViewModel: ObservableObject {
    var authManager: AuthManager
    
    init(authManager: AuthManager) {
        self.authManager = authManager
    }
    
    @Published var email: String = ""
    @Published var password: String = ""
    
    func signUp() async throws {
        guard !email.isEmpty, !password.isEmpty else {
            print("no email or password found")
            return
        }
        
        let authData = try await authManager.createUser(email: email, password: password)
        try UserManager.shared.createNewUser(user: DBUser(auth: authData))
    }
    
    func signIn() async throws {
        guard !email.isEmpty, !password.isEmpty else {
            print("no email or password given")
            return
        }
        
        try await authManager.signIn(email: email, password: password)
    }
}
