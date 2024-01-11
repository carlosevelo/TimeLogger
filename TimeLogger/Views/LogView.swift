//
//  LogView.swift
//  TimeLogger
//
//  Created by Carlos Evelo on 9/28/23.
//

import SwiftUI
import SwiftData

struct LogView: View {
    @Environment(\.modelContext) var context: ModelContext
    @Query(sort: [SortDescriptor(\TimeEntry.CreatedDate, order: .reverse)]) var entries: [TimeEntry]
    
    var body: some View {
        VStack{
            Button(
                action: {
                    if (buttonState == ButtonState.ClockIn ) {
                        context.insert(TimeEntry())
                    }
                    else {
                        var lastestEntry = entries.first
                        lastestEntry?.OutValue = .now
                    }
                },
                label: {
                    Text(buttonState.rawValue)
                }
            )
            .buttonStyle(PrimaryButtonStyle(backgroundColor: buttonState == ButtonState.ClockIn ? Color.blue : Color.red))
        }
        .frame(width: 300, height: 500)
    }
}

extension LogView {
    var buttonState: ButtonState {
        entries.first != nil
            ? entries.first?.OutValue != nil
                ? ButtonState.ClockIn
                : ButtonState.ClockOut
            : ButtonState.ClockIn
    }
}

enum ButtonState : String {
    case ClockIn = "Clock-in"
    case ClockOut = "Clock-out"
}

struct LogView_Previews: PreviewProvider {
    static var previews: some View {
        LogView().modelContainer(previewContainer)
    }
}
