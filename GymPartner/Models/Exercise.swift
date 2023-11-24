//
//  Exercise.swift
//  GymPartner
//
//  Created by Klaudiusz Mękarski on 22/11/2023.
//

import Foundation

struct Exercise: Identifiable {
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
}
