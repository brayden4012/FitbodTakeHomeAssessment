//
//  FitbodTakeHomeAssessmentApp.swift
//  FitbodTakeHomeAssessment
//
//  Created by Brayden Harris on 6/16/24.
//

import ExerciseDomain
import ExerciseUI
import SwiftUI

@main
struct FitbodTakeHomeAssessmentApp: App {
    let networkService = NetworkService()

    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ExerciseListScreen(
                    viewModel: ExerciseListViewModel(
                        exerciseService: ExerciseService(
                            networkService: networkService
                        )
                    )
                )
            }
        }
    }
}
