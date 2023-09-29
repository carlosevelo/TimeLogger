//
//  Log.swift
//  TimeLogger
//
//  Created by Carlos Evelo on 9/28/23.
//

import Foundation

public class Log {
    private var Value: Date
    private var LogType: LogType
    
    init (value: Date, type: LogType) {
        Value = value;
        LogType = type
    }
}

 
enum LogType {
    case In
    case Out
}
