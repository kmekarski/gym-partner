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
    case selectExercise
}

struct MyPlansView: View {
    @EnvironmentObject var homeVM: HomeViewModel
    @EnvironmentObject var authVM: AuthViewModel
    @EnvironmentObject var createPlanVM: CreatePlanViewModel
    @State var user: DBUser?
    var body: some View {
        ZStack {
            switch homeVM.myPlansState {
            case .browse:
                BrowseMyPlansView()
            case .createInitial:
                CreatePlanView()
            case .selectExercise:
                SelectExerciseView()
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
