//
//  PlanDay.swift
//  GymPartner
//
//  Created by Klaudiusz Mękarski on 23/11/2023.
//

import Foundation

struct PlanDay: Identifiable, Equatable {
    static func == (lhs: PlanDay, rhs: PlanDay) -> Bool {
        return lhs.id == rhs.id
    }
    
    let id: String
    var name: String
    var exercises: [PlanExercise]
    
    init(name: String) {
        self.id = UUID().uuidString
        self.name = name
        self.exercises = []
    }
    
    init(name: String, exercises: [PlanExercise]) {
        self.id = UUID().uuidString
        self.name = name
        self.exercises = exercises
    }}
