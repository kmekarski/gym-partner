//
//  PlanExercise.swift
//  GymPartner
//
//  Created by Klaudiusz Mękarski on 24/11/2023.
//

import Foundation

struct PlanExercise {
    let exercise: Exercise
    var setsNumber: Int
    var repsNumber: Int
    var restSeconds: Int
    
    init(exercise: Exercise) {
        self.exercise = exercise
        self.setsNumber = 3
        self.repsNumber = 10
        self.restSeconds = 120
    }
}
