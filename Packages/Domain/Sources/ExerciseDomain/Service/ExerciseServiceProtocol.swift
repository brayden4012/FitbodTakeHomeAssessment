//
//  ExerciseServiceProtocol.swift
//  ExerciseDomain
//
//  Created by Brayden Harris on 6/17/24.
//

import Foundation

public protocol ExerciseServiceProtocol {
    func getExercises() async throws -> [Exercise]
}
