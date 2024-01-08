//
//  ReportsView.swift
//  TimeLogger
//
//  Created by Carlos Evelo on 9/28/23.
//

import SwiftUI
import SwiftData

struct ReportsView: View {
    @Query(sort: [SortDescriptor(\TimeEntry.CreatedDate, order: .reverse)]) var entries: [TimeEntry]
    var body: some View {
        Table(entries) {
            TableColumn("Date") { entry in
                Text(entry.CreatedDate, style: .date)
            }
            TableColumn("In") { entry in
                Text(entry.InValue, style: .date)
            }
            TableColumn("Out") { entry in
                if let outValue = entry.OutValue {
                    Text(outValue, style: .date)
                }
                else {
                    Text("Nil")
                }
            }
        }
    }
}

struct ReportsView_Previews: PreviewProvider {
    static var previews: some View {
        ReportsView()
    }
}
