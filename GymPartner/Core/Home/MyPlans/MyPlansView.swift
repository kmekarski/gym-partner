//
//  MyPlansView.swift
//  GymPartner
//
//  Created by Klaudiusz Mękarski on 22/11/2023.
//

import SwiftUI

struct MyPlansView: View {
    @EnvironmentObject var homeVM: HomeViewModel
    @EnvironmentObject var authVM: AuthViewModel
    @State var user: DBUser?
    var body: some View {
        VStack {
            if let user = user, let name = user.username{
                Text("hello \(name)")
            }
        }
        .onAppear() {
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

struct MyPlansView_Previews: PreviewProvider {
    static var previews: some View {
        MyPlansView()
            .environmentObject(dev.homeViewModel)
    }
}
