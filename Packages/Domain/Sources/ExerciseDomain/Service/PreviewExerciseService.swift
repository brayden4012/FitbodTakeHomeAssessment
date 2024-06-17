//
//  PreviewExerciseService.swift
//  ExerciseDomain
//
//  Created by Brayden Harris on 6/17/24.
//

import Foundation

public class PreviewExerciseService: ExerciseServiceProtocol {
    public init() { }
    public func getExercises() async throws -> [Exercise] {
        .mockValues()
    }
}
