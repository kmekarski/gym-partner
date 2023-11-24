//
//  ExerciseRowView.swift
//  GymPartner
//
//  Created by Klaudiusz Mękarski on 24/11/2023.
//

import SwiftUI

struct ExerciseRowView: View {
    var exercise: Exercise
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(exercise.name)
                .font(.system(size: 18, weight: .semibold))
            Text(exercise.bodyPartsString())
                .font(.system(size: 16, weight: .regular))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color(.systemGray5))
        .cornerRadius(10, corners: .allCorners)
    }
}

struct ExerciseRowView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ExerciseRowView(exercise: Exercise(id: "1", name: "Bench press", bodyParts: [.chest, .tricep]))
            ExerciseRowView(exercise: Exercise(id: "2", name: "Squat", bodyParts: [.legs]))
        }
        .padding()
    }
}
