//
//  SignInEmailView.swift
//  GymPartner
//
//  Created by Klaudiusz Mękarski on 21/11/2023.
//

import SwiftUI

struct SignInEmailView: View {
    @EnvironmentObject var vm: SignInEmailViewModel
    @Binding var showSignInView: Bool
    var body: some View {
        VStack {
            TextField("Email", text: $vm.email)
                .padding()
                .background(Color.gray.opacity(0.4))
                .cornerRadius(10)
            SecureField("Password", text: $vm.password)
                .padding()
                .background(Color.gray.opacity(0.4))
                .cornerRadius(10)
            Button {
                Task {
                    do {
                        try await vm.signUp()
                        showSignInView = false
                        return
                        
                    } catch {
                        print("Error \(error)")
                    }
                    do {
                        try await vm.signIn()
                        showSignInView = false
                        return
                    } catch {
                        print("Error \(error)")
                    }
                }
            } label: {
                WideAccentButton("Sign up")
            }
            Spacer()
        }
        .padding()
    }
}

struct SignInEmailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SignInEmailView(showSignInView: .constant(true))
        }
    }
}
