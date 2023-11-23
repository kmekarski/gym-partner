//
//  HomeViewModel.swift
//  GymPartner
//
//  Created by Klaudiusz Mękarski on 21/11/2023.
//

import Foundation

final class HomeViewModel: ObservableObject {
    @Published var myPlansState: MyPlansState = .browse
    @Published var newPlanName: String = ""

    init() {
        
    }
    
    func resetViews() {
        myPlansState = .browse
        newPlanName = ""
    }
}
