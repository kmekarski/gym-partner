//
//  WorkoutInHistory.swift
//  GymPartner
//
//  Created by Klaudiusz Mękarski on 23/11/2023.
//

import Foundation

struct WorkoutInHistory: Identifiable {
    let id: String
    let name: String
    let planName: String
    let numberOfExercises: Int16
    let numberOfSets: Int16
    let date: Date
    let timeInSeconds: Int16
}
