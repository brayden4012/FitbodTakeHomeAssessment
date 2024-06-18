//
//  ExerciseRowView.swift
//  ExerciseUI
//
//  Created by Brayden Harris on 6/16/24.
//

import ExerciseDomain
import SwiftUI

struct ExerciseRowView: View {
    let exercises: [Exercise]
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                Text(exercises.first?.name ?? "--")
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
                Text(exercises.overallOneRepMaxDisplay)
                    .font(.largeTitle)
            }
            Text("One Rep Max • lbs")
                .font(.subheadline)
                .foregroundStyle(Color.secondary)
        }
    }
}

#Preview {
    ExerciseRowView(exercises: .mockValues())
}
