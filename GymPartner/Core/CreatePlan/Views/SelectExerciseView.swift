//
//  SelectExerciseView.swift
//  GymPartner
//
//  Created by Klaudiusz Mękarski on 24/11/2023.
//

import SwiftUI

struct SelectExerciseView: View {
    @EnvironmentObject var homeVM: HomeViewModel
    @EnvironmentObject var createPlanVM: CreatePlanViewModel
    var body: some View {
        VStack {
            header
            bodyPartPicker
            if createPlanVM.filteredExercises.isEmpty {
                noExercisesFoundMessage
            } else {
                exerciseList
            }
            Spacer()
        }
        .padding()
    }
}

struct SelectExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        SelectExerciseView()
            .environmentObject(dev.homeViewModel)
            .environmentObject(dev.createPlanViewModel)
    }
}

extension SelectExerciseView {
    private var header: some View {
        HStack(spacing: 20) {
            Button {
                homeVM.myPlansState = .createInitial
            } label: {
                RoundedSquareButton(systemName: "chevron.left", border: true)
                    .frame(width: 50, height: 50)
            }
            IconTextField(title: "Exercise name or body part", text: $createPlanVM.exerciseQuery, iconName: "magnifyingglass")
        }
    }
    
    private var bodyPartPicker: some View {
        Picker("Body part", selection: $createPlanVM.selectedBodyPart) {
            ForEach(BodyPart.allCases, id: \.self) { bodyPart in
                Text(bodyPart.rawValue.capitalized)
            }
        }
        .frame(maxWidth: .infinity, alignment: .trailing)
    }
    
    
    private var exerciseList: some View {
        ScrollView {
            VStack {
                ForEach(createPlanVM.filteredExercises) { exercise in
                    ExerciseRowView(exercise: exercise)
                }
            }
        }
        .padding(.vertical)
    }
    
    private var noExercisesFoundMessage: some View {
        VStack {
            Spacer()
            Text("No exercises found")
                .font(.system(size: 20, weight: .regular))
            Spacer()
        }
    }
}
