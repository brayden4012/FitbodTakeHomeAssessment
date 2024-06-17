//
//  Exercise.swift
//  ExerciseDomain
//
//  Created by Brayden Harris on 6/17/24.
//

import Foundation

public struct Exercise: Hashable {
    public var name: String
    public var date: Date
    public var weight: Decimal
    public var reps: Int
    
    public init(
        name: String,
        date: Date,
        weight: Decimal,
        reps: Int
    ) {
        self.name = name
        self.date = date
        self.weight = weight
        self.reps = reps
    }
    
    var oneRepMax: Decimal {
        weight / (1.0278 - (0.0278 * Decimal(reps)))
    }
}

public extension Exercise {
    static func mockValue(injectedValues: [PartialKeyPath<Exercise>: Any] = [:]) -> Self {
        Exercise(
            name: injectedValues[\.name] as? String ?? "Name",
            date: injectedValues[\.date] as? Date ?? Date(),
            weight: injectedValues[\.weight] as? Decimal ?? 100,
            reps: injectedValues[\.reps] as? Int ?? 1
        )
    }
}

public extension Array where Element == Exercise {
    static func mockValues(numberOfValues: Int = 10) -> Self {
        (0..<numberOfValues).map {
            Exercise.mockValue(injectedValues: [\.name: String($0)])
        }
    }
    
    var groupedByExercise: [String: [Exercise]] {
        Dictionary(grouping: self, by: { $0.name })
    }
    
    var groupedByDate: [Date: [Exercise]] {
        Dictionary(grouping: self, by: { $0.date })
    }
    
    var averageOneRepMax: Decimal {
        var sumOneRepMax = Decimal.zero
        forEach {
            sumOneRepMax += $0.oneRepMax
        }
        
        return sumOneRepMax / Decimal(count)
    }
    
    var averageOneRepMaxDisplay: String {
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = .zero
        return formatter.string(from: NSDecimalNumber(decimal: averageOneRepMax)) ?? "--"
    }
}

public extension Array where Element == [Exercise] {
    static func mockValues(numberOfValues: Int = 10) -> Self {
        (0..<numberOfValues).map { _ -> [Exercise] in
            [Exercise].mockValues(numberOfValues: 1)
        }
    }
}
