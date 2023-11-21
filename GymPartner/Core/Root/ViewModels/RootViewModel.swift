//
//  RootViewModel.swift
//  GymPartner
//
//  Created by Klaudiusz Mękarski on 21/11/2023.
//

import Foundation

final class RootViewModel: ObservableObject {
    
    var authManager: AuthManager
    
    init(authManager: AuthManager) {
        self.authManager = authManager
    }
}
