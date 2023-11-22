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
}
