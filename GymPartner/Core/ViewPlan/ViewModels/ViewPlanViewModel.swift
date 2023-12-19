//
//  ViewPlanViewModel.swift
//  GymPartner
//
//  Created by Klaudiusz Mękarski on 19/12/2023.
//

import Foundation

final class ViewPlanViewModel: ObservableObject {
    @Published var plan: Plan?
    
    func selectPlan(_ plan: Plan?) {
        self.plan = plan
    }
}
