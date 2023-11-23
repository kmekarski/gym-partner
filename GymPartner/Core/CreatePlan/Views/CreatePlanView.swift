//
//  CreatePlanView.swift
//  GymPartner
//
//  Created by Klaudiusz Mękarski on 22/11/2023.
//

import SwiftUI

struct CreatePlanView: View {
    @EnvironmentObject var createPlanVM: CreatePlanViewModel
    @EnvironmentObject var homeVM: HomeViewModel
    var body: some View {
        VStack {
            HStack {
                Text("Create plan")
                Button("Back") {
                    homeVM.myPlansState = .browse
                }
            }
            
            TextField("Exercise name or body part", text: $createPlanVM.exerciseQuery)
            Picker("Body part", selection: $createPlanVM.selectedBodyPart) {
                ForEach(BodyPart.allCases, id: \.self) { bodyPart in
                    Text(bodyPart.rawValue.capitalized)
                }
            }
            VStack {
                ForEach(createPlanVM.filteredExercises) { exercise in
                    Text(exercise.name)
                }
            }
        }
        .padding()
    }
}

struct CreatePlanView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            CreatePlanView()
                .environmentObject(dev.homeViewModel)
                .environmentObject(dev.createPlanViewModel)
        }
    }
}
