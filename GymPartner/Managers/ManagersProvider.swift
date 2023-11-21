//
//  ManagersProvider.swift
//  GymPartner
//
//  Created by Klaudiusz Mękarski on 21/11/2023.
//

import Foundation

final class ManagersProvider {
    
    static func provideAuthManager() -> AuthManager {
        return AuthManager()
    }
    
}
