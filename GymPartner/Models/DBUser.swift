//
//  DBUser.swift
//  GymPartner
//
//  Created by Klaudiusz Mękarski on 21/11/2023.
//

import Foundation

struct DBUser: Codable {
    let userId: String
    let username: String?
    let email: String?
    let photoUrl: String?
    let dateCreated: Date?
    let plans: [Plan]?
    
    init(auth: AuthUser) {
        self.userId = auth.uid
        self.username = auth.username
        self.email = auth.email
        self.photoUrl = auth.photoUrl
        self.dateCreated = Date()
        self.plans = []
    }
    
    init(auth: AuthUser, username: String) {
        self.userId = auth.uid
        self.username = username
        self.email = auth.email
        self.photoUrl = auth.photoUrl
        self.dateCreated = Date()
        self.plans = []
    }
    
    init(userId: String,
         username: String? = nil,
         email: String? = nil,
         photoUrl: String? = nil,
         dateCreated: Date? = nil,
         plans: [Plan] = []
    ) {
        self.userId = userId
        self.username = username
        self.email = email
        self.photoUrl = photoUrl
        self.dateCreated = dateCreated
        self.plans = plans
    }
    
    enum CodingKeys: String, CodingKey {
        case userId = "user_id"
        case username = "username"
        case email = "email"
        case photoUrl = "photo_url"
        case dateCreated = "date_created"
        case plans = "plans"
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.userId, forKey: .userId)
        try container.encodeIfPresent(self.username, forKey: .username)
        try container.encodeIfPresent(self.email, forKey: .email)
        try container.encodeIfPresent(self.photoUrl, forKey: .photoUrl)
        try container.encodeIfPresent(self.dateCreated, forKey: .dateCreated)
        try container.encodeIfPresent(self.plans, forKey: .plans)
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.userId = try container.decode(String.self, forKey: .userId)
        self.username = try container.decodeIfPresent(String.self, forKey: .username)
        self.email = try container.decodeIfPresent(String.self, forKey: .email)
        self.photoUrl = try container.decodeIfPresent(String.self, forKey: .photoUrl)
        self.dateCreated = try container.decodeIfPresent(Date.self, forKey: .dateCreated)
        self.plans = try container.decodeIfPresent([Plan].self, forKey: .plans)
    }
}
