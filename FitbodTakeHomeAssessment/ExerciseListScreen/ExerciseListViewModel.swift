//
//  ExerciseListViewModel.swift
//  FitbodTakeHomeAssessment
//
//  Created by Brayden Harris on 6/16/24.
//

import Combine
import ExerciseDomain

final class ExerciseListViewModel: ObservableObject {
    @Published var exercises: [Exercise]
}
