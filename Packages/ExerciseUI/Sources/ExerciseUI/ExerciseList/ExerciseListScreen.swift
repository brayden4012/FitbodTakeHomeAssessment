//
//  ExerciseListScreen.swift
//  ExerciseUI
//
//  Created by Brayden Harris on 6/16/24.
//

import ExerciseDomain
import SwiftUI

public struct ExerciseListScreen: View {
    @StateObject var viewModel: ExerciseListViewModel
    
    public init(viewModel: ExerciseListViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    public var body: some View {
        List(viewModel.exercises, id: \.self) { exercises in
            NavigationLink {
                ExerciseDetailsScreen(exercises: exercises)
            } label: {
                ExerciseRowView(exercises: exercises)
            }
        }
        .listStyle(.plain)
        .navigationTitle("My Exercises")
        .task {
            await viewModel.getExercises()
        }
        .redacted(reason: viewModel.viewState.loadingState == .loading ? .placeholder : [])
    }
}

#Preview {
    ExerciseListScreen(viewModel: ExerciseListViewModel(exerciseService: PreviewExerciseService()))
}
