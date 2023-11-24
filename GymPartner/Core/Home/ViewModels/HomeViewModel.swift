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
    @Published var days: [PlanDay] = []
    @Published var selectedDay: PlanDay?
    init() {
        
    }
    
    func resetViews() {
        myPlansState = .browse
        newPlanName = ""
    }
    
    func dayIsSelected(day: PlanDay) -> Bool {
        guard let selectedDay = selectedDay else { return false }
        return selectedDay.id == day.id
    }
    
    func noExercisesInSelectedDay() -> Bool {
        guard let selectedDay = selectedDay else { return false }
        return selectedDay.exercises.isEmpty
    }
    
    func selectedDayExercises() -> [Exercise] {
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
            updatedDay.exercises.append(exercise)
            days[index] = updatedDay
            selectedDay = updatedDay
        }
    }
    
    func deleteExercise(day: PlanDay?, exerciseIndex: Int) {
        guard let day = day else { return }
        if let index = days.firstIndex(where: { planDay in
            planDay.id == day.id
        }) {
            var updatedDay = days[index]
            updatedDay.exercises.remove(at: exerciseIndex)
            days[index] = updatedDay
            selectedDay = updatedDay
        }
    }
}
