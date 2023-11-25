//
//  UserManager.swift
//  GymPartner
//
//  Created by Klaudiusz Mękarski on 21/11/2023.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

final class UserManager {    
    private let userCollection = Firestore.firestore().collection("users")
    
    private let encoder: Firestore.Encoder = {
        let encoder = Firestore.Encoder()
        return encoder
    }()
    
    private let decoder: Firestore.Decoder = {
        let decoder = Firestore.Decoder()
        return decoder
    }()
    
    private func userDocument(userId: String) -> DocumentReference {
        return userCollection.document(userId)
    }
    
    func createNewUser(user: DBUser) throws {
        try userDocument(userId: user.userId).setData(from: user, merge: false)
    }
    
    func getUser(userId: String) async throws -> DBUser {
        try await userDocument(userId: userId).getDocument(as: DBUser.self)
    }
    
    func addUserPlan(userId: String, plan: Plan) async throws {
        guard let planData = try? encoder.encode(plan) else {
            throw URLError(.badURL)
        }
        let data: [String:Any] = [
            DBUser.CodingKeys.plans.rawValue: FieldValue.arrayUnion([planData])
        ]
        try await userDocument(userId: userId).updateData(data)
    }
}

