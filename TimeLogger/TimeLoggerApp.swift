//
//  TimeLoggerApp.swift
//  TimeLogger
//
//  Created by Carlos Evelo on 9/28/23.
//

import SwiftUI
import SQLite

@main
struct TimeLoggerApp: App {
    @StateObject var State = TimeLoggerState()
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
