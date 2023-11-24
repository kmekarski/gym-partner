//
//  ExerciseEditRowView.swift
//  GymPartner
//
//  Created by Klaudiusz Mękarski on 24/11/2023.
//

import SwiftUI

struct PlanExerciseRowView: View {
    @EnvironmentObject var homeVM: HomeViewModel
    var day: PlanDay
    var exerciseIndex: Int
    var exercise: PlanExercise?
    
    init(day: PlanDay, exerciseIndex: Int) {
        self.day = day
        self.exerciseIndex = exerciseIndex
        if exerciseIndex <= day.exercises.count - 1 {
            self.exercise = day.exercises[exerciseIndex]
        }
    }
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            if let exercise = self.exercise {
                HStack {
                    Text(exercise.exercise.name)
                        .font(.system(size: 18, weight: .semibold))
                    Spacer()

                    Button {
                        homeVM.deleteExercise(day: day, exerciseIndex: exerciseIndex)
                    } label: {
                        Image(systemName: "xmark")
                            .font(.system(size: 13))
                            .padding(.leading, 8)
                    }
                }
                    Text(exercise.exercise.bodyPartsString())
                        .font(.system(size: 16, weight: .regular))
                        .frame(width: .infinity, alignment: .leading)
                Divider()
                    .padding(.vertical, 8)
                HStack {
                    VStack{
                        HStack {
                            Text("Sets:")
                            Text("\(exercise.setsNumber)")
                                .font(.system(size: 16, weight: .semibold))
                        }
                        NumberStepper(value: exercise.setsNumber, min: 1, max: 99, onMinus: minusSets, onPlus: plusSets)
                    }
                    .frame(width: 100)
                    VStack{
                        HStack {
                            Text("Reps:")
                            Text("\(exercise.repsNumber)")
                                .font(.system(size: 16, weight: .semibold))
                        }
                        NumberStepper(value: exercise.repsNumber, min: 1, max: 99, onMinus: minusReps, onPlus: plusReps)
                    }
                    .frame(width: 100)
                    VStack {
                        HStack {
                            Text("Rest:")
                            Text("\(exercise.restSeconds)s")
                                .font(.system(size: 16, weight: .semibold))
                        }
                        NumberStepper(value: exercise.restSeconds, min: 10, max: 990, seconds: true, onMinus: minusRest, onPlus: plusRest)
                    }
                    .frame(width: 100)
                }
                .frame(maxWidth: .infinity)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color(.systemGray5))
        .cornerRadius(10, corners: .allCorners)
    }
}

struct PlanExerciseRowView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            PlanExerciseRowView(day: dev.planDays.first!, exerciseIndex: 1)
            PlanExerciseRowView(day: dev.planDays.first!, exerciseIndex: 1)
        }
        .padding()
        .environmentObject(dev.homeViewModel)
    }
}

extension PlanExerciseRowView {
    private func minusSets() {
        homeVM.changeNumberOfSets(day: day, exerciseIndex: exerciseIndex, sign: .minus)
    }
    
    private func plusSets() {
        homeVM.changeNumberOfSets(day: day, exerciseIndex: exerciseIndex, sign: .plus)
    }
    
    private func minusReps() {
        homeVM.changeNumberOfReps(day: day, exerciseIndex: exerciseIndex, sign: .minus)
    }
    
    private func plusReps() {
        homeVM.changeNumberOfReps(day: day, exerciseIndex: exerciseIndex, sign: .plus)
    }
    
    private func minusRest() {
        homeVM.changeTimeOfRestBetweenSets(day: day, exerciseIndex: exerciseIndex, sign: .minus)
    }
    
    private func plusRest() {
        homeVM.changeTimeOfRestBetweenSets(day: day, exerciseIndex: exerciseIndex, sign: .plus)
    }
}
