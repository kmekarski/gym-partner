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
    let authorName: String?
    let authorPhotoUrl: String?
    
    init(
        id: String,
        name: String,
        days: [PlanDay],
        tags: [PlanTag],
        authorName: String? = nil,
        authorPhotoUrl: String? = nil) {
            self.id = id
            self.name = name
            self.days = days
            self.tags = tags
            self.authorName = authorName
            self.authorPhotoUrl = authorPhotoUrl
        }
}
