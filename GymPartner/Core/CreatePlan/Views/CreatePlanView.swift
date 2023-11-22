//
//  CreatePlanView.swift
//  GymPartner
//
//  Created by Klaudiusz Mękarski on 22/11/2023.
//

import SwiftUI

struct CreatePlanView: View {
    @EnvironmentObject var createPlanVM: CreatePlanViewModel
    var body: some View {
        VStack {
            Text("Create plan")
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
        CreatePlanView()
            .environmentObject(dev.createPlanViewModel)
    }
}
