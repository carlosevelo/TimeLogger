//
//  LogView.swift
//  TimeLogger
//
//  Created by Carlos Evelo on 9/28/23.
//

import SwiftUI

struct LogView: View {
    var state: LoggerState
    var logViewModel = LogViewModel()

    var body: some View {
        VStack{
            Button(action: {
                print("Pressed!")
                logViewModel.LogNewTimeStamp()
            }){
               Text(state.logType == LogType.In ? "Clock-in" : "Clock-out")
               .frame(width: 200, height: 200)
               .foregroundColor(Color.black)
               .background(state.logType == LogType.In ? Color.blue : Color.red)
               .clipShape(Circle())
            }.buttonStyle(PlainButtonStyle())
        }.frame(width: 300, height: 500)
        
    }
}

struct LogView_Previews: PreviewProvider {
    static var previews: some View {
        LogView(state: LoggerState(logType: LogType.In))
    }
}
