//
//  PlanExercise.swift
//  GymPartner
//
//  Created by Klaudiusz Mękarski on 24/11/2023.
//

import Foundation

struct PlanExercise: Codable {
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
    
    enum CodingKeys: String, CodingKey {
        case exercise
        case setsNumber = "sets_number"
        case repsNumber = "reps_number"
        case restSeconds = "rest_seconds"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.exercise = try container.decode(Exercise.self, forKey: .exercise)
        self.setsNumber = try container.decode(Int.self, forKey: .setsNumber)
        self.repsNumber = try container.decode(Int.self, forKey: .repsNumber)
        self.restSeconds = try container.decode(Int.self, forKey: .restSeconds)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.exercise, forKey: .exercise)
        try container.encode(self.setsNumber, forKey: .setsNumber)
        try container.encode(self.repsNumber, forKey: .repsNumber)
        try container.encode(self.restSeconds, forKey: .restSeconds)
    }
}
