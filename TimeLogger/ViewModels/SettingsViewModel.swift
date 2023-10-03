//
//  SettingsViewModel.swift
//  TimeLogger
//
//  Created by Carlos Evelo on 10/3/23.
//

import Foundation
import SQLite

struct SettingsViewModel {
    public func BuildDb() {
        var db = DbFactory.GetDb()
        
        let timeEntry = Table("TimeEntry")
        let id = Expression<Int64>("id")
        let inValue = Expression<Date?>("inValue")
        let outValue = Expression<Date?>("outValue")
        
        //Create the table
        do {
            try db?.run(timeEntry.create { t in
                t.column(id, primaryKey: .autoincrement)
                t.column(inValue)
                t.column(outValue)
            })
        }
        catch let error {
            print("Could not create tables: \(error)")
        }
    }
}
