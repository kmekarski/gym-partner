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
    
    static func provideUserManager() -> UserManager {
        return UserManager()
    }
    
    static func provideExerciseManager() -> ExerciseManager {
        return ExerciseManager()
    }
}
