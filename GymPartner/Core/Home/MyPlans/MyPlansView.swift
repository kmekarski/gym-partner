//
//  MyPlansView.swift
//  GymPartner
//
//  Created by Klaudiusz Mękarski on 22/11/2023.
//

import SwiftUI

enum PlanCreationState {
    case menu
    case initial
}

struct MyPlansView: View {
    @EnvironmentObject var homeVM: HomeViewModel
    @EnvironmentObject var authVM: AuthViewModel
    @EnvironmentObject var createPlanVM: CreatePlanViewModel
    @State var user: DBUser?
    @State var showNewPlanModal: Bool = false
    var body: some View {
        ZStack {
            switch homeVM.planCreationState {
            case .menu:
                VStack {
                    Text("My plans")
                    Button {
                        showNewPlanModal = true
                    } label: {
                        WideAccentButton("+")
                    }
                }
                .padding()
            case .initial:
                CreatePlanView()
            }
            
            ModalWithTextField(title: "New plan", text: $createPlanVM.newPlanName, isShowing: $showNewPlanModal) {
                homeVM.planCreationState = .initial
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
