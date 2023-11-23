//
//  SignUpView.swift
//  GymPartner
//
//  Created by Klaudiusz Mękarski on 22/11/2023.
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift

struct SignUpView: View {
    @EnvironmentObject var authVM: AuthViewModel
    @StateObject var signUpVM = SignUpViewModel()
    @Binding var authViewType: AuthViewType
    @State var username: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @State var password2: String = ""
    var body: some View {
        VStack {
            Text("Sign Up")
                .font(.title)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom)
            
            googleSignInButton
            
            Text("or sign up using email:")
                .foregroundColor(.theme.secondaryText)
                .padding(.vertical, 24)
            
            signUpForm
            
            HStack {
                Text("Already have an acount?")
                    .font(.headline)
                    .foregroundColor(.theme.secondaryText)
                goToSignInButton
            }
            
            Spacer()
        }
        .padding(32)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(authViewType: .constant(.signUp))
            .environmentObject(dev.authViewModel)
    }
}

extension SignUpView {
    private var signUpForm: some View {
        VStack(spacing: 24) {
            IconTextField(title: "Username", text: $signUpVM.username, iconName: "person")
            IconTextField(title: "Email", text: $signUpVM.email, iconName: "at")
            IconTextField(title: "Password", text: $signUpVM.password, iconName: "lock", secure: true)
            IconTextField(title: "Repeat password", text: $signUpVM.password2, iconName: "lock", secure: true)
            Button {
                Task {
                    do {
                        try await authVM.signUpEmail(
                            username: signUpVM.username,
                            email: signUpVM.email,
                            password: signUpVM.password)
                        authViewType = .none
                    } catch {
                        print(error)
                    }
                }
            } label: {
                WideAccentButton("Sign up")
                    .padding(.top, 8)
            }
        }
        .padding(.bottom, 24)
    }
    
    private var googleSignInButton: some View {
        GoogleSignInButton(scheme: .light, style: .wide, state: .normal) {
            Task {
                do {
                    try await authVM.signInGoogle()
                    authViewType = .none
                } catch {
                    print(error)
                }
            }
        }
    }
    
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
