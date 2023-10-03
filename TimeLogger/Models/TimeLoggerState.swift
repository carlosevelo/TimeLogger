//
//  TimeLoggerState.swift
//  TimeLogger
//
//  Created by Carlos Evelo on 10/3/23.
//

import Foundation
import SQLite

class TimeLoggerState : ObservableObject {
    @Published public var State: TimeState
    
    init() {
        var db = DbFactory.GetDb()
        var timeEntry = Table("timeEntry")
        var id = Expression<Int64>("id")
        var inValue = Expression<Date>("inValue")
        var outValue = Expression<Date>("outValue")
        
        var result = timeEntry.order(id.desc).limit(1)
        do {
            var lastEntry = try db.pluck(result)
            var inTime = try lastEntry?.get(inValue)
            var outTime = try lastEntry?.get(outValue)
            if (inTime != nil && outTime != nil) {
                State = TimeState.TimeIn
            }
            else if (inTime != nil && outTime == nil) {
                State = TimeState.TimeOut
            }
            else if (inTime == nil) {
                State = TimeState.TimeError
            }
        }
        catch {
            print("Error setting time state.")
            State = TimeState.TimeError
        }
        State = TimeState.TimeError
    }
}

enum TimeState {
    case TimeIn
    case TimeOut
    case TimeError
}
