//
//  TimeEntry.swift
//  TimeLogger
//
//  Created by Carlos Evelo on 9/28/23.
//

import Foundation
import SwiftData

@Model
final class TimeEntry: Identifiable {
    var CreatedDate: Date
    var InValue: Date
    var OutValue: Date?
    let id = UUID()
    
    init(CreatedDate: Date = .now, InValue: Date = .now, OutValue: Date?) {
        self.CreatedDate = CreatedDate
        self.InValue = InValue
        self.OutValue = OutValue
    }
}


