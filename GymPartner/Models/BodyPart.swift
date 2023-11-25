//
//  BodyPart.swift
//  GymPartner
//
//  Created by Klaudiusz Mękarski on 22/11/2023.
//

import Foundation

enum BodyPart: String, CaseIterable, Codable {
    case none = "any body part"
    case chest = "chest"
    case bicep = "bicep"
    case tricep = "tricep"
    case forearms = "forearms"
    case shoulders = "shoulders"
    case core = "core"
    case back = "back"
    case legs = "legs"
    case glutes = "glutes"
    case quads = "quads"
    case hamstrings = "hamstrings"
    case calves = "calves"
}
