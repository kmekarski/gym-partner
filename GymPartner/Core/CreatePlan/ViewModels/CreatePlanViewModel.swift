//
//  CreatePlanViewModel.swift
//  GymPartner
//
//  Created by Klaudiusz Mękarski on 22/11/2023.
//

import Foundation
import Combine

final class CreatePlanViewModel: ObservableObject {
    @Published var filteredExercises: [Exercise] = []
    @Published var allBodyParts: [BodyPart] = BodyPart.allCases
    @Published var selectedBodyPart: BodyPart = .none
    @Published var exerciseQuery: String = ""
    
    private var exerciseManager: ExerciseManager
    private var cancellables = Set<AnyCancellable>()
    
    init(exerciseManager: ExerciseManager) {
        self.exerciseManager = exerciseManager
        self.addSubscribers()
    }
    
    private func addSubscribers() {
        $exerciseQuery
            .combineLatest(exerciseManager.$allExercises, $selectedBodyPart)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map(filterAndSearchExercises)
            .sink { [weak self] returnedExercises in
                self?.filteredExercises = returnedExercises
            }
            .store(in: &cancellables)
    }
    
    private func filterAndSearchExercises(text: String, exercises: [Exercise], selectedBodyPart: BodyPart) -> [Exercise] {
        if text == "" && selectedBodyPart == .none {
            // no filtering or searching
            return exercises
        } else if text == "" {
            // only filtering by body part
            return filterExercisesByBodyPart(exercises: exercises, selectedBodyPart: selectedBodyPart)
        } else if selectedBodyPart == .none {
            // only searching by text
            return searchExercises(text: text, exercises: exercises)
        } else {
            // both searching and filtering
            let searchResult = searchExercises(text: text, exercises: exercises)
            return filterExercisesByBodyPart(exercises: searchResult, selectedBodyPart: selectedBodyPart)
        }
    }
    
    private func filterExercisesByBodyPart(exercises: [Exercise], selectedBodyPart: BodyPart) -> [Exercise] {
        let filteredExercises = exercises.filter { exercise -> Bool in
            return exercise.bodyParts.contains(selectedBodyPart)
        }
        return filteredExercises
    }
    
    private func searchExercises(text: String, exercises: [Exercise]) -> [Exercise] {
        guard !text.isEmpty else { return exercises }
        let lowercasedText = text.lowercased()
        let searchedExercises = exercises.filter { exercise -> Bool in
            let exerciseNameContainsQuery = exercise.name.lowercased().contains(lowercasedText)
            let oneOfExercisesBodyPartsContainsQuery = exercise.bodyParts.contains { bodyPart in
                bodyPart.rawValue.contains(lowercasedText)
            }
            return exerciseNameContainsQuery || oneOfExercisesBodyPartsContainsQuery
        }
        return searchedExercises
    }
    
    
}
