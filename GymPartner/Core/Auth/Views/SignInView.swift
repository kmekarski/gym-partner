//
//  SignInView.swift
//  GymPartner
//
//  Created by Klaudiusz Mękarski on 22/11/2023.
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift

struct SignInView: View {
    @EnvironmentObject var authVM: AuthViewModel
    @StateObject var signInVM = SignInViewModel()
    @Binding var authViewType: AuthViewType
    @State var email: String = ""
    @State var password: String = ""
    var body: some View {
        VStack {
            Text("Sign In")
                .font(.title)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 32)
            
            signInForm
            
            Text("or:")
                .foregroundColor(.theme.secondaryText)
                .padding(.vertical)

            googleSignInButton
            
            HStack {
                Text("New to GymPartner?")
                    .font(.headline)
                    .foregroundColor(.theme.secondaryText)
                goToSignUpButton
            }
            
            Spacer()
        }
        .padding(32)
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView(authViewType: .constant(.signIn))
            .environmentObject(dev.authViewModel)
    }
}

extension SignInView {
    
    private var signInForm: some View {
        VStack(spacing: 24) {
            IconTextField(title: "Email", text: $signInVM.email, iconName: "at")
            IconTextField(title: "Password", text: $signInVM.password, iconName: "lock", secure: true)
            Button {
                
            } label: {
                Text("Forgot password?")
                    .foregroundColor(.theme.accent)
            }
            Button {
                Task {
                    do {
                        try await authVM.signInEmail(
                            email: signInVM.email,
                            password: signInVM.password)
                        authViewType = .none
                    } catch {
                        print(error)
                    }
                }
            } label: {
                WideAccentButton("Sign in")
            }
        }
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
        .padding(.bottom, 24)
    }
    
    private var goToSignUpButton: some View {
        Button {
            withAnimation(.spring()) {
                authViewType = .signUp
            }
        } label: {
            Text("Sign up")
                .font(.headline)
        }
    }
}
