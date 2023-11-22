//
//  ExerciseManager.swift
//  GymPartner
//
//  Created by Klaudiusz Mękarski on 22/11/2023.
//

import Foundation

final class ExerciseManager {
    @Published var allExercises: [Exercise] = [
        Exercise(id: "1", name: "Squat", bodyParts: [.legs, .quads, .glutes]),
        Exercise(id: "2", name: "Bench Press", bodyParts: [.chest, .tricep]),
        Exercise(id: "5", name: "Shoulder Press", bodyParts: [.shoulders])
    ]
}
