//
//  MyPlansView.swift
//  GymPartner
//
//  Created by Klaudiusz Mękarski on 22/11/2023.
//

import SwiftUI

struct MyPlansView: View {
    @EnvironmentObject var vm: HomeViewModel
    @State var user: AuthUser?
    var body: some View {
        VStack {
            if let user = try? vm.authManager.getAuthenticatedUser() {
                Text("hello \(user.name ?? "user")")
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
