//
//  ExerciseListViewModel.swift
//  ExerciseUI
//
//  Created by Brayden Harris on 6/16/24.
//

import Combine
import ExerciseDomain

public final class ExerciseListViewModel: ObservableObject {
    @Published var exercises = [[Exercise]].mockValues()
    @Published var viewState = ExerciseListViewState()
    
    private let exerciseService: ExerciseServiceProtocol
    
    public init(
        exerciseService: ExerciseServiceProtocol
    ) {
        self.exerciseService = exerciseService
    }
    
    @MainActor
    func getExercises() async {
        do {
            exercises = try await exerciseService.getExercises().groupedByExercise.sorted(by: { $0.key < $1.key }).map { $0.value }
            viewState.loadingState = .loaded
        } catch {
            viewState.loadingState = .error
        }
    }
}
