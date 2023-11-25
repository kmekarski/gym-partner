//
//  Exercise.swift
//  GymPartner
//
//  Created by Klaudiusz Mękarski on 22/11/2023.
//

import Foundation

struct Exercise: Identifiable, Codable {
    let id: String
    let name: String
    let bodyParts: [BodyPart]
    
    func bodyPartsString() -> String {
        var result = ""
        
        for (index,bodyPart) in self.bodyParts.enumerated() {
            result += bodyPart.rawValue
            if index < self.bodyParts.count - 1 {
                result += ", "
            }
        }
        return result
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case bodyParts = "body_parts"
    }
    
    init(id: String, name: String, bodyParts: [BodyPart]) {
        self.id = id
        self.name = name
        self.bodyParts = bodyParts
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.bodyParts = try container.decode([BodyPart].self, forKey: .bodyParts)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.bodyParts, forKey: .bodyParts)
    }
}
