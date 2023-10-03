//
//  LogView.swift
//  TimeLogger
//
//  Created by Carlos Evelo on 9/28/23.
//

import SwiftUI

struct LogView: View {
    @EnvironmentObject var loggerState: TimeLoggerState
    var logViewModel = LogViewModel()

    var body: some View {
        VStack{
            Button(action: {
                print("Pressed!")
                logViewModel.LogNewTimeStamp()
            }){
                Text(loggerState.State == TimeState.TimeIn ? "Clock-in" : "Clock-out")
               .frame(width: 200, height: 200)
               .foregroundColor(Color.black)
               .background(loggerState.State == TimeState.TimeIn ? Color.blue : Color.red)
               .clipShape(Circle())
            }.buttonStyle(PlainButtonStyle())
        }.frame(width: 300, height: 500)
        
    }
}

//struct LogView_Previews: PreviewProvider {
//    static var previews: some View {
//        LogView(loggerState: TimeLoggerState())
//    }
//}
