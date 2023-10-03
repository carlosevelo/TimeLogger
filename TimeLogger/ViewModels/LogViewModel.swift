//
//  LogViewModel.swift
//  TimeLogger
//
//  Created by Carlos Evelo on 9/28/23.
//

import Foundation
import SQLite

class LogViewModel {
    
    func LogNewTimeStamp() {
        var db = DbFactory.GetDb()
        var timeEntry = Table("timeEntry")
        let inValue = Expression<Date?>("inValue")
        let outValue = Expression<Date?>("outValue")
        
        do {
            if (true) {
                try db?.run(timeEntry.upsert(inValue <- Date.now, outValue <- nil, onConflictOf: inValue))
            }
            else {
                try db?.run(timeEntry.upsert(inValue <- nil, outValue <- Date.now, onConflictOf: outValue))
            }
        }
        catch {
            
        }
    }
}
