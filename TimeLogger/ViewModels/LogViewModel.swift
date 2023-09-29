//
//  LogViewModel.swift
//  TimeLogger
//
//  Created by Carlos Evelo on 9/28/23.
//

import Foundation

class LogViewModel {
    
    
    func LogNewTimeStamp() {
        var newTimeStamp = Log(value: Date.now, type: LogType.In)
    }
}
