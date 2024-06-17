//
//  ExerciseService.swift
//  ExerciseDomain
//
//  Created by Brayden Harris on 6/17/24.
//

import Foundation
import Networking

public final class ExerciseService: ExerciseServiceProtocol {
    public enum ExerciseServiceError: Error {
        case missingData
    }
    var networkService: NetworkingService
    
    public init(networkService: NetworkingService) {
        self.networkService = networkService
    }
    
    public func getExercises() async throws -> [Exercise] {
        guard let path = Bundle.module.path(forResource: "workoutData", ofType: "txt") else { throw ExerciseServiceError.missingData }
        let data = try String(contentsOfFile: path, encoding: .utf8)
        let strings = data.components(separatedBy: .newlines)
        return strings.compactMap { Exercise(from: $0) }
    }
}
