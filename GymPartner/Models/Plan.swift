//
//  Plan.swift
//  GymPartner
//
//  Created by Klaudiusz Mękarski on 23/11/2023.
//

import Foundation

struct Plan: Identifiable {
    let id: String
    let name: String
    let days: [PlanDay]
    let tags: [PlanTag]
}
