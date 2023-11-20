//
//  AuthUser.swift
//  GymPartner
//
//  Created by Klaudiusz Mękarski on 20/11/2023.
//

import Foundation
import FirebaseAuth

struct AuthUser {
    let uid: String
    let email: String?
    let photoUrl: String?
    
    init(user: User) {
        self.uid = user.uid
        self.email = user.email
        self.photoUrl = user.photoURL?.absoluteString
    }
}
