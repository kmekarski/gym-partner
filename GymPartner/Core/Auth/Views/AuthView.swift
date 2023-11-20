//
//  AuthView.swift
//  GymPartner
//
//  Created by Klaudiusz Mękarski on 20/11/2023.
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift

struct AuthView: View {
    @StateObject private var vm = AuthViewModel()
    var body: some View {
        GoogleSignInButton(viewModel: GoogleSignInButtonViewModel(scheme: .dark, style: .wide, state: .normal)) {
            Task {
                do {
                    try await vm.signInGoogle()
                } catch {
                    print(error)
                }
            }
        }
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
