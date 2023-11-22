//
//  HomeViewModel.swift
//  GymPartner
//
//  Created by Klaudiusz Mękarski on 21/11/2023.
//

import Foundation

final class HomeViewModel: ObservableObject {
    @Published var authManager: AuthManager
    
    @Published var planCreationState: PlanCreationState = .menu
    
    init(authManager: AuthManager) {
        self.authManager = authManager
    }
}
