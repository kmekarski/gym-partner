//
//  AuthView.swift
//  GymPartner
//
//  Created by Klaudiusz Mękarski on 20/11/2023.
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift

enum AuthViewType {
    case signIn
    case signUp
    case none
}

struct AuthView: View {
    @EnvironmentObject var vm: AuthViewModel
    @Binding var authViewType: AuthViewType
    var body: some View {
        ZStack {
            switch authViewType {
            case .signIn:
                SignInView(authViewType: $authViewType)
                    .transition(.move(edge: .leading))
            case .signUp:
                SignUpView(authViewType: $authViewType)
                    .transition(.move(edge: .trailing))
            case .none:
                EmptyView()
            }
        }
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView(authViewType: .constant(.signIn))
                .environmentObject(dev.authViewModel)
    }
}
