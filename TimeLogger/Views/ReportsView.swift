//
//  ReportsView.swift
//  TimeLogger
//
//  Created by Carlos Evelo on 9/28/23.
//

import SwiftUI
import SwiftData

struct ReportsView: View {
    @Query(sort: [SortDescriptor(\TimeEntry.CreatedDate)]) var entries: [TimeEntry]
    var body: some View {
        VStack {
            // Header
            HStack {
                Text("Date")
                Text("In")
                Text("Out")
            }
            //Body
            ForEach(entries) { entry in
                HStack {
                    Text(entry.CreatedDate, style: .date)
                    Text(entry.InValue, style: .date)
                    if let outValue = entry.OutValue {
                        Text(outValue, style: .date)
                    }
                    else {
                        Text("Nil")
                    }
                }
            }
            
        }
        Table(entries) {
            TableColumn("Date") { entry in
                Text(entry.CreatedDate, style: .date)
            }.width(200)
            TableColumn("In") { entry in
                Text("in")
            }
            TableColumn("In") { entry in
                Text(entry.InValue, style: .date)
            }.width(200)
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
        ReportsView().modelContainer(previewContainer)
    }
}
