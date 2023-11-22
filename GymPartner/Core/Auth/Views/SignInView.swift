//
//  SignInView.swift
//  GymPartner
//
//  Created by Klaudiusz Mękarski on 22/11/2023.
//

import SwiftUI

struct SignInView: View {
    @Binding var authViewType: AuthViewType
    var body: some View {
        VStack {
            Text("Sign In")
            goToSignUpButton
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView(authViewType: .constant(.signIn))
    }
}

extension SignInView {
    private var goToSignUpButton: some View {
        Button {
            withAnimation(.spring()) {
                authViewType = .signUp
            }
        } label: {
            Text("Sign up")
        }
    }
}
