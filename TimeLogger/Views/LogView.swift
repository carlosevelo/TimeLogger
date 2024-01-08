//
//  LogView.swift
//  TimeLogger
//
//  Created by Carlos Evelo on 9/28/23.
//

import SwiftUI
import SwiftData

struct LogView: View {
    @Query(sort: [SortDescriptor(\TimeEntry.CreatedDate, order: .reverse)]) var entries: [TimeEntry]
    var buttonState: ButtonState {
        if let lastest = entries.first {
            return lastest.OutValue == nil ? ButtonState.ClockOut : ButtonState.ClockIn
        }
        else {
            return ButtonState.ClockIn
        }
    }
    @Environment(\.modelContext) private var modelContext

    var body: some View {
        VStack{
            Button(action: {
                print("Pressed!")
                if (buttonState == ButtonState.ClockIn) {
                    let newTimeStamp = TimeEntry(OutValue: nil)
                    modelContext.insert(newTimeStamp)
                }
                else {
                    entries.first?.OutValue = .now
                }
            }){
                Text(buttonState == ButtonState.ClockIn ? "Clock-in" : "Clock-out")
               .frame(width: 200, height: 200)
               .foregroundColor(Color.black)
               .background(buttonState == ButtonState.ClockIn ? Color.blue : Color.red)
               .clipShape(Circle())
            }.buttonStyle(PlainButtonStyle())
        }.frame(width: 300, height: 500)
        
    }
}

enum ButtonState {
    case ClockIn
    case ClockOut
}

struct LogView_Previews: PreviewProvider {
    static var previews: some View {
        LogView().modelContainer(previewContainer)
    }
}
