//
//  SettingsView.swift
//  GymPartner
//
//  Created by Klaudiusz Mękarski on 20/11/2023.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var vm: SettingsViewModel
    @Binding var authViewType: AuthViewType
    var body: some View {
        List {
            if vm.authProviders.contains(.email) {
                emailSettings
                passwordSettings
            }
            
            Button("Sign out") {
                Task {
                    do {
                        try vm.signOut()
                        authViewType = .signIn
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
            SettingsView(authViewType: .constant(.none))
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
