//
//  Plan.swift
//  GymPartner
//
//  Created by Klaudiusz Mękarski on 23/11/2023.
//

import Foundation

struct Plan: Identifiable, Codable {
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
        authorName: String?,
        authorPhotoUrl: String?) {
            self.id = id
            self.name = name
            self.days = days
            self.tags = tags
            self.authorName = authorName
            self.authorPhotoUrl = authorPhotoUrl
        }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.days, forKey: .days)
        try container.encode(self.tags, forKey: .tags)
        try container.encode(self.authorName, forKey: .authorName)
        try container.encode(self.authorPhotoUrl, forKey: .authorPhotoUrl)
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.days = try container.decode([PlanDay].self, forKey: .days)
        self.tags = try container.decode([PlanTag].self, forKey: .tags)
        self.authorName = try container.decode(String.self, forKey: .authorName)
        self.authorPhotoUrl = try container.decode(String.self, forKey: .authorPhotoUrl)
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case days
        case tags
        case authorName = "author_name"
        case authorPhotoUrl = "author_photo_url"
    }
}
