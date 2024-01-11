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
    let CreatedDate: Date
    var InValue: Date
    var OutValue: Date?
    let id = UUID()
    
    var Total: TimeInterval? {
        if let outValue = self.OutValue {
            return outValue.timeIntervalSince(self.InValue)
        }
        else {
            return nil
        }
    }
    
    init() {
        self.CreatedDate = .now
        self.InValue = .now
        self.OutValue = nil
    }
    
    init(CreatedDate: Date = .now, InValue: Date = .now, OutValue: Date?) {
        self.CreatedDate = CreatedDate
        self.InValue = InValue
        self.OutValue = OutValue
    }
}

extension Date {
    func ToDateOnlyString() -> String {
        let newFormatter = Foundation.DateFormatter()
        newFormatter.dateFormat = "MMM d"
        return newFormatter.string(from: self)
    }
    
    func ToTimeOnlyString() -> String {
        let newFormatter = Foundation.DateFormatter()
        newFormatter.dateFormat = "h:mm a"
        return newFormatter.string(from: self)
    }
}

extension TimeInterval {
    func ToFormattedString() -> String {
        let interval = Int(self)
        let seconds = interval % 60
        let minutes = (interval / 60) % 60
        let hours = (interval / (60*60)) % 60
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
}

