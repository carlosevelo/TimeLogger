//
//  ReportsView.swift
//  TimeLogger
//
//  Created by Carlos Evelo on 9/28/23.
//

import SwiftUI
import SwiftData

struct ReportsView: View {
    @Environment(\.modelContext) var context: ModelContext
    @Query(sort: [SortDescriptor(\TimeEntry.CreatedDate)]) var entries: [TimeEntry]
    
    var body: some View {
        ZStack {
            Grid {
                GridRow {
                    Text("Date")
                    Text("In")
                    Text("Out")
                    Text("Total")
                }
                .bold()
                Divider()
                ForEach(entries) { entry in
                    GridRow {
                        Text(entry.CreatedDate.ToDateOnlyString())
                        Text(entry.InValue.ToTimeOnlyString())
                        if let outValue = entry.OutValue {
                            Text(outValue.ToTimeOnlyString())
                            Text(entry.Total?.ToFormattedString() ?? "00:00:00")
                        }
                        else {
                            SetTimeView(entry: entry)
                            Text(entry.Total?.ToFormattedString() ?? "00:00:00")
                        }
                    }
                    .padding(.vertical, 0.5)
                }
                Spacer()
            }
            .padding(.top)
        }
    }
}

struct ReportsView_Previews: PreviewProvider {
    static var previews: some View {
        ReportsView().modelContainer(previewContainer)
    }
}

struct SetTimeView: View {
    var entry: TimeEntry
    @State var enteredTime = Date.now
    @State var showTimePicker = false
    
    var body: some View {
        Button(entry.OutValue?.ToTimeOnlyString() ?? "Set") {
            showTimePicker.toggle()
        }
        .buttonStyle(.plain)
        .foregroundStyle(.blue)
        .popover(isPresented: $showTimePicker, content: {
            VStack {
                HStack {
                    Button("Cancel") {
                        showTimePicker.toggle()
                    }
                    .padding()
                    Spacer()
                    Button("Set") {
                        entry.OutValue = enteredTime
                        showTimePicker.toggle()
                    }
                    .font(.system(size: 20, weight: .semibold))
                    .padding()
                }
                Spacer()
                Text("Enter Time")
                    .font(.system(size: 20, weight: .light, design: .rounded))
                Spacer()
                DatePicker("Out time", selection: $enteredTime, displayedComponents: .hourAndMinute)
                    .datePickerStyle(.wheel)
                    .labelsHidden()
                Spacer()
            }
            .presentationDetents([.medium])
        })
    }
}
