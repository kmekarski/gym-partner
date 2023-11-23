//
//  MyPlansView.swift
//  GymPartner
//
//  Created by Klaudiusz Mękarski on 22/11/2023.
//

import SwiftUI

enum MyPlansState {
    case browse
    case createInitial
}

struct MyPlansView: View {
    @EnvironmentObject var homeVM: HomeViewModel
    @EnvironmentObject var authVM: AuthViewModel
    @EnvironmentObject var createPlanVM: CreatePlanViewModel
    @State var user: DBUser?
    @State var showNewPlanModal: Bool = false
    var body: some View {
        ZStack {
            switch homeVM.myPlansState {
            case .browse:
                BrowseMyPlansView(showNewPlanModal: $showNewPlanModal)
            case .createInitial:
                CreatePlanView()
            }
            
            ModalWithTextField(title: "New plan", text: $homeVM.newPlanName, isShowing: $showNewPlanModal) {
                homeVM.myPlansState = .createInitial
            }
        }
    }
}

struct MyPlansView_Previews: PreviewProvider {
    static var previews: some View {
        MyPlansView()
            .environmentObject(dev.homeViewModel)
            .environmentObject(dev.authViewModel)
            .environmentObject(dev.createPlanViewModel)
    }
}
