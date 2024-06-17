//
//  ExerciseListScreen.swift
//  FitbodTakeHomeAssessment
//
//  Created by Brayden Harris on 6/16/24.
//

import SwiftUI

struct ExerciseListScreen: View {
    @StateObject var viewModel = ExerciseListViewModel()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ExerciseListScreen()
}
