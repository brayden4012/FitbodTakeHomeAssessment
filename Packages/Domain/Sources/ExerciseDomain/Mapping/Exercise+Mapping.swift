//
//  Exercise+Mapping.swift
//  ExerciseDomain
//
//  Created by Brayden Harris on 6/17/24.
//

import Foundation

extension Exercise {
    init?(from string: String) {
        let comps = string.components(separatedBy: ",")
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd yyyy"
        guard comps.count >= 4,
              let date = formatter.date(from: comps[0]),
              let reps = Int(comps[2]),
              let weight = Decimal(string: comps[3]) else {
            return nil
        }
        let name = comps[1]
        self.init(
            name: name,
            date: date,
            weight: weight,
            reps: reps
        )
    }
}
