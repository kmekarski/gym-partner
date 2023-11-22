//
//  SignUpView.swift
//  GymPartner
//
//  Created by Klaudiusz Mękarski on 22/11/2023.
//

import SwiftUI

struct SignUpView: View {
    @Binding var authViewType: AuthViewType
    var body: some View {
        VStack {
            Text("Sign Up")
            goToSignInButton
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(authViewType: .constant(.signUp))
    }
}

extension SignUpView {
    private var goToSignInButton: some View {
        Button {
            withAnimation(.spring()) {
                authViewType = .signIn
            }
        } label: {
            Text("Sign in")
        }
    }
}
