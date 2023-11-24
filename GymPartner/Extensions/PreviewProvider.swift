//
//  PreviewProvider.swift
//  GymPartner
//
//  Created by Klaudiusz Mękarski on 21/11/2023.
//

import Foundation
import SwiftUI

extension PreviewProvider {
    static var dev: DeveloperPreview {
        DeveloperPreview.instance
    }
}

final class DeveloperPreview {
    static let instance = DeveloperPreview()
    
    let authManager: AuthManager
    let userManager: UserManager
    let exerciseManager: ExerciseManager
    let authViewModel: AuthViewModel
    let rootViewModel: RootViewModel
    let homeViewModel: HomeViewModel
    let settingsViewModel: SettingsViewModel
    let createPlanViewModel: CreatePlanViewModel
    
    let benchPressExercise = Exercise(id: "1", name: "Bench press", bodyParts: [.chest, .tricep])
    let squatExercise = Exercise(id: "2", name: "Squat", bodyParts: [.legs, .glutes, .quads])
    
    let planExercises: [PlanExercise]
    
    let planDays: [PlanDay]

    let tags1: [PlanTag] = [.expert, .strength, .cardio]
    let tags2: [PlanTag] = [.beginner, .cardio]
    
    let workoutInHistory = WorkoutInHistory(
        id: "1",
        name: "Push day",
        planName: "Intermediate FBW",
        numberOfExercises: 10,
        numberOfSets: 18,
        date: Date(),
        timeInSeconds: 3600 - 180)
    
    var plans: [Plan]
    
    private init() {
        authManager = ManagersProvider.provideAuthManager()
        userManager = ManagersProvider.provideUserManager()
        exerciseManager = ManagersProvider.provideExerciseManager()
        rootViewModel = RootViewModel(authManager: authManager)
        homeViewModel = HomeViewModel()
        authViewModel = AuthViewModel(authManager: authManager, userManager: userManager)
        settingsViewModel = SettingsViewModel(authManager: authManager)
        createPlanViewModel = CreatePlanViewModel(exerciseManager: exerciseManager)
        
        planExercises = [
            PlanExercise(exercise: benchPressExercise),
            PlanExercise(exercise: squatExercise),
        ]
        
        planDays = [
            PlanDay(name: "Day 1", exercises: planExercises),
            PlanDay(name: "Day 2", exercises: planExercises)
        ]
        
        plans = [
            Plan(id: "1", name: "Intermediate Full Body Workout", days: planDays, tags: tags1, authorName: "someGuy123", authorPhotoUrl: "https://fastly.picsum.photos/id/936/96/96.jpg?hmac=d1amt6UQzVBoq3zj1HI-5Sv4sJLogXpzqiLSuwbmBEE"),
            Plan(id: "2", name: "Some other plan", days: planDays, tags: tags2, authorName: "otherGuy789", authorPhotoUrl: "https://fastly.picsum.photos/id/567/96/96.jpg?hmac=2t58DxDsk0q6eabOjL-zmUFQQwyCVq5Ryc7aUzYb5sA")
        ]
    }
    
}
