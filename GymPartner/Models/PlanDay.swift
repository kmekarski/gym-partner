//
//  PlanDay.swift
//  GymPartner
//
//  Created by Klaudiusz Mękarski on 23/11/2023.
//

import Foundation

struct PlanDay: Identifiable, Equatable, Codable {
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
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.exercises, forKey: .exercises)
    }
    
    enum CodingKeys: CodingKey {
        case id
        case name
        case exercises
    }
}
