//
//  TimeLoggerApp.swift
//  TimeLogger
//
//  Created by Carlos Evelo on 9/28/23.
//

import SwiftUI
import SwiftData

@main
struct TimeLoggerApp: App {
      var body: some Scene {
        WindowGroup {
            MainView()
        }
        .modelContainer(for: TimeEntry.self)
    }
}
