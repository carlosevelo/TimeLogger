//
//  TestData.swift
//  TimeLogger
//
//  Created by Carlos Evelo on 1/8/24.
//

import SwiftUI
import SwiftData

@MainActor
let previewContainer: ModelContainer = {
    do {
        let container = try ModelContainer(
            for: TimeEntry.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true)
        )
        for entry in TestData.timeEntries {
            container.mainContext.insert(entry)
        }
        return container
    } catch {
        fatalError("Failed to create container.")
    }
}()

struct TestData {
    static var timeEntries = [TimeEntry(
                        CreatedDate: .now.addingTimeInterval(TimeInterval(10000)),
                        InValue: .now.addingTimeInterval(TimeInterval(10000)),
                        OutValue: .now.addingTimeInterval(TimeInterval(20000))),
                       TimeEntry(
                        CreatedDate: .now.addingTimeInterval(TimeInterval(10000)), 
                        InValue: .now.addingTimeInterval(TimeInterval(20000)),
                        OutValue: .now.addingTimeInterval(TimeInterval(20000))),
                       TimeEntry(
                        CreatedDate: .now.addingTimeInterval(TimeInterval(10000)),
                        InValue: .now.addingTimeInterval(TimeInterval(10000)),
                        OutValue: .now.addingTimeInterval(TimeInterval(20000))),
                       TimeEntry(
                        CreatedDate: .now.addingTimeInterval(TimeInterval(10000)), 
                        InValue: .now.addingTimeInterval(TimeInterval(10000)),
                        OutValue: .now.addingTimeInterval(TimeInterval(20000))),
                       TimeEntry(
                        CreatedDate: .now.addingTimeInterval(TimeInterval(10000)),
                        InValue: .now.addingTimeInterval(TimeInterval(10000)), 
                        OutValue: .now.addingTimeInterval(TimeInterval(20000))),
                       TimeEntry(
                        CreatedDate: .now.addingTimeInterval(TimeInterval(10000)),
                        InValue: .now.addingTimeInterval(TimeInterval(10000)), 
                        OutValue: .now.addingTimeInterval(TimeInterval(20000))),
                       TimeEntry(
                        CreatedDate: .now.addingTimeInterval(TimeInterval(10000)),
                        InValue: .now.addingTimeInterval(TimeInterval(10000)), 
                        OutValue: nil)]
}
