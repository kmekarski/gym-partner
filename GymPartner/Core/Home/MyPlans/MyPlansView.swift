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
        NavigationStack {
            VStack {
                Text("My plans")
                NavigationLink {
                    CreatePlanView()
                } label: {
                    WideAccentButton("+")
                }
            }
            .padding()
        }
    }
}

struct MyPlansView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            MyPlansView()
                .environmentObject(dev.homeViewModel)
        }
    }
}
