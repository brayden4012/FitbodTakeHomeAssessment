//
//  ExerciseListViewState.swift
//  ExerciseUI
//
//  Created by Brayden Harris on 6/16/24.
//

import Foundation

struct ExerciseListViewState {
    enum LoadingState {
        case loading, loaded, error
    }
    var loadingState: LoadingState = .loading
}
