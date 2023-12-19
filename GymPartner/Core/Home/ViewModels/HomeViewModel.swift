//
//  HomeViewModel.swift
//  GymPartner
//
//  Created by Klaudiusz Mękarski on 21/11/2023.
//

import Foundation
import Combine

final class HomeViewModel: ObservableObject {
    @Published var myPlansState: MyPlansState = .browse
    @Published var newPlanName: String = ""
    @Published var days: [PlanDay] = []
    @Published var tags: [PlanTag] = []
    @Published var selectedDay: PlanDay?
    @Published var userPlans: [Plan] = []
    
    @Published var tokens: Set<AnyCancellable> = []
    
    private var userManager: UserManager
    private var authManager: AuthManager
    
    init(userManager: UserManager, authManager: AuthManager) {
        self.userManager = userManager
        self.authManager = authManager
        
        observeUserUpdates()
    }
    
    private func observeUserUpdates() {
        authManager.userPublisher
            .receive(on: DispatchQueue.main)
            .sink { completion in
                print("Handle \(completion) for error and finished subscription.")
            } receiveValue: { authUser in
                let userId = authUser.userId
                Task {
                    do {
                        let user = try await self.userManager.getUser(userId: userId)
                        if let plans = user.plans {
                            self.userPlans = plans
                        }
                    } catch {
                        throw error
                    }
                }
                
            }
            .store(in: &tokens)
    }
    
    func resetViews() {
        myPlansState = .browse
        newPlanName = ""
    }
    
    func loadPlans() async throws {
        let authUser = try authManager.getAuthenticatedUser()
        if let plans = try await userManager.getUser(userId: authUser.uid).plans {
            userPlans = plans
        }
    }
    
    func savePlan() async throws {
        let authUser = try authManager.getAuthenticatedUser()
        if let username = authUser.username,
           let photoUrl = authUser.photoUrl {
            let plan = Plan(id: UUID().uuidString, name: newPlanName, days: days, tags: tags, authorName: username, authorPhotoUrl: photoUrl)
            try await userManager.addUserPlan(userId: authUser.uid, plan: plan)
        }
    }
    
    func dayIsSelected(day: PlanDay) -> Bool {
        guard let selectedDay = selectedDay else { return false }
        return selectedDay.id == day.id
    }
    
    func noExercisesInSelectedDay() -> Bool {
        guard let selectedDay = selectedDay else { return false }
        return selectedDay.exercises.isEmpty
    }
    
    func selectedDayExercises() -> [PlanExercise] {
        guard let selectedDay = selectedDay else { return [] }
        return selectedDay.exercises
    }
    
    func addNewDay(name: String) {
        days.append(PlanDay(name: name))
        selectedDay = days.last
    }
    
    func renameDay(day: PlanDay?, newName: String) {
        guard let day = day else { return }
        if let index = days.firstIndex(where: { planDay in
            planDay.id == day.id
        }) {
            var updatedDay = days[index]
            updatedDay.name = newName
            days[index] = updatedDay
            selectedDay = updatedDay
        }
    }
    
    func deleteDay(day: PlanDay?) {
        guard let day = day else { return }
        days.removeAll(where: { planDay in
            planDay.id == day.id
        })
        selectedDay = days.last
    }
    
    func addExercise(day: PlanDay?, exercise: Exercise) {
        guard let day = day else { return }
        if let index = days.firstIndex(where: { planDay in
            planDay.id == day.id
        }) {
            var updatedDay = days[index]
            updatedDay.exercises.append(PlanExercise(exercise: exercise))
            days[index] = updatedDay
            selectedDay = updatedDay
        }
    }
    
    func deleteExercise(day: PlanDay?, exerciseIndex: Int) {
        guard let day = day else { return }
        if let index = days.firstIndex(where: { planDay in
            planDay.id == day.id
        }) {
            var updatedExercises = days[index].exercises
            updatedExercises.remove(at: exerciseIndex)
            days[index].exercises = updatedExercises
            selectedDay = days[index]
        }
    }
    
    enum Sign {
        case minus
        case plus
    }
    
    func changeNumberOfSets(day: PlanDay?, exerciseIndex: Int, sign: Sign) {
        guard let day = day else { return }
        if let index = days.firstIndex(where: { planDay in
            planDay.id == day.id
        }) {
            var updatedExercise = days[index].exercises[exerciseIndex]
            switch sign {
            case .minus:
                updatedExercise.setsNumber -= 1
            case .plus:
                updatedExercise.setsNumber += 1
            }
            days[index].exercises[exerciseIndex] = updatedExercise
            selectedDay = days[index]
        }
    }
    
    func changeNumberOfReps(day: PlanDay?, exerciseIndex: Int, sign: Sign) {
        guard let day = day else { return }
        if let index = days.firstIndex(where: { planDay in
            planDay.id == day.id
        }) {
            var updatedExercise = days[index].exercises[exerciseIndex]
            switch sign {
            case .minus:
                updatedExercise.repsNumber -= 1
            case .plus:
                updatedExercise.repsNumber += 1
            }
            days[index].exercises[exerciseIndex] = updatedExercise
            selectedDay = days[index]
        }
    }
    
    func changeTimeOfRestBetweenSets(day: PlanDay?, exerciseIndex: Int, sign: Sign) {
        guard let day = day else { return }
        if let index = days.firstIndex(where: { planDay in
            planDay.id == day.id
        }) {
            var updatedExercise = days[index].exercises[exerciseIndex]
            switch sign {
            case .minus:
                updatedExercise.restSeconds -= 10
            case .plus:
                updatedExercise.restSeconds += 10
            }
            days[index].exercises[exerciseIndex] = updatedExercise
            selectedDay = days[index]
        }
    }
    
}
