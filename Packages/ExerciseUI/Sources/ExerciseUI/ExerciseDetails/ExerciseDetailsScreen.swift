//
//  ExerciseDetailsScreen.swift
//  ExerciseUI
//
//  Created by Brayden Harris on 6/16/24.
//

import Charts
import ExerciseDomain
import SwiftUI

struct ExerciseDetailsScreen: View {
    let exercises: [[Exercise]]
    
    init(exercises: [Exercise]) {
        self.exercises = exercises.groupedByDate
            .map { $0.value }
        .sorted(by: { $0[0].date < $1[0].date})
    }
    
    var body: some View {
        VStack(spacing: 50) {
            ExerciseRowView(exercises: exercises.flatMap { $0 })
            chart
        }
        .padding(.horizontal)
        .frame(maxHeight: .infinity, alignment: .top)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private var chart: some View {
        Chart(exercises, id: \.self) {
            LineMark(
                x: .value("Date", $0[0].date),
                y: .value("One Rep Max", $0.overallOneRepMax)
            )
            .symbol {
                Circle()
                    .strokeBorder(Color.primary)
                    .background(Circle().fill(Color.primary).colorInvert())
                    .frame(width: 10, height: 10)
            }
            .foregroundStyle(Color.primary)
        }
        .dynamicTypeSize(...DynamicTypeSize.accessibility1)
        .chartYScale(domain: yAxisDomain)
        .chartYAxis {
            AxisMarks(
                values: yAxisValues,
                stroke: StrokeStyle(lineWidth: 0)
            )
        }
        .chartXAxis {
            var firstInstancesOfYear = Set<Date>()
            AxisMarks(values: xAxisValues) { value in
                if let date = value.as(Date.self) {
                    AxisValueLabel {
                        VStack(alignment: .leading) {
                            Text(date, format: .dateTime.month().day())
                            
                            if let year = yearLabel(for: date, firstInstancesOfYear: &firstInstancesOfYear) {
                                Text(year)
                            }
                        }
                    }
                }
            }
        }
        .frame(height: 150)
    }
    
    private func yearLabel(for date: Date, firstInstancesOfYear: inout Set<Date>) -> String? {
        print("\(date)")
        let year = Calendar.current.component(.year, from: date)
        if firstInstancesOfYear.contains(date) {
            return String(year)
        } else if !firstInstancesOfYear.contains(where: { Calendar.current.component(.year, from: $0) == year }) {
            firstInstancesOfYear.insert(date)
            return String(year)
        }
        return nil
    }
    
    private var yAxisDomain: ClosedRange<Decimal> {
        return sortedOneRepMaxes[0]...sortedOneRepMaxes[sortedOneRepMaxes.count - 1]
    }
    
    private var yAxisValues: [Decimal] {
        return [
            sortedOneRepMaxes[0],
            sortedOneRepMaxes[sortedOneRepMaxes.count - 1]
        ]
    }
    
    private var sortedOneRepMaxes: [Decimal] {
        exercises.map { $0.overallOneRepMax }.sorted()
    }
    
    private var xAxisValues: AxisMarkValues {
        guard let numDays = Calendar.current.dateComponents([.day], from: exercises[0][0].date, to: exercises[exercises.count - 1][0].date).day else { return .automatic }
        let interval = numDays / 5
        
        return .stride(by: .day, count: interval)
    }
}

#Preview {
    ExerciseDetailsScreen(exercises: .mockValues())
}
