//
//  SettingsView.swift
//  GymPartner
//
//  Created by Klaudiusz Mękarski on 20/11/2023.
//

import SwiftUI

struct SettingsView: View {
    @StateObject private var vm = SettingsViewModel()
    @Binding var showSignInView: Bool
    @Binding var showSettings: Bool
    var body: some View {
        List {
            Button {
                withAnimation(.spring()) {
                    showSettings = false
                }
            } label: {
                Image(systemName: "chevron.left")
            }
            if vm.authProviders.contains(.email) {
                emailSettings
                passwordSettings
            }
            
            Button("Sign out") {
                Task {
                    do {
                        try vm.signOut()
                        showSignInView = true
                        showSettings = false
                    } catch {
                        print(error)
                    }
                }
            }
        }
        .onAppear() {
            vm.loadAuthProviders()
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SettingsView(showSignInView: .constant(false), showSettings: .constant(true))
        }
    }
}

extension SettingsView {
    private var passwordSettings: some View {
        Section("Password settings") {
            Button("Reset password") {
                Task {
                    do {
                        try await vm.resetPassword()
                    } catch {
                        print(error)
                    }
                }
            }
            Button("Update password") {
                Task {
                    do {
                        try await vm.updatePassword()
                    } catch {
                        print(error)
                    }
                }
            }
        }
    }
    
    private var emailSettings: some View {
        Section("Email settings") {
            Button("Update email") {
                Task {
                    do {
                        try await vm.updateEmail()
                    } catch {
                        print(error)
                    }
                }
            }
        }
    }
}
