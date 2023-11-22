//
//  SettingsView.swift
//  GymPartner
//
//  Created by Klaudiusz Mękarski on 20/11/2023.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var settingsVM: SettingsViewModel
    @EnvironmentObject var homeVM: HomeViewModel
    @EnvironmentObject var authVM: AuthViewModel
    @Binding var authViewType: AuthViewType
    @State var user: DBUser?
    
    var body: some View {
        List {
            if let id = user?.userId{
                Text("user ID: \(id)")
            }
            if let username = user?.username{
                Text("username: \(username)")
            }
            if let email = user?.email{
                Text("email: \(email)")
            }
            if let photoUrl = user?.photoUrl {
                AsyncImage(url: URL(string: photoUrl))
            }
            if settingsVM.authProviders.contains(.email) {
                emailSettings
                passwordSettings
            }
            
            Button("Sign out") {
                Task {
                    do {
                        try settingsVM.signOut()
                        authViewType = .signIn
                    } catch {
                        print(error)
                    }
                }
            }
        }
        .onAppear() {
            settingsVM.loadAuthProviders()
            Task {
                do {
                    user = try await authVM.getAuthenticatedUser()
                } catch {
                    print(error)
                }
            }
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
                        try await settingsVM.resetPassword()
                    } catch {
                        print(error)
                    }
                }
            }
            Button("Update password") {
                Task {
                    do {
                        try await settingsVM.updatePassword()
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
                        try await settingsVM.updateEmail()
                    } catch {
                        print(error)
                    }
                }
            }
        }
    }
}
