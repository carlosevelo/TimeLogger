//
//  DbFactory.swift
//  TimeLogger
//
//  Created by Carlos Evelo on 10/3/23.
//

import Foundation
import SQLite

class DbFactory {
    static let path = NSSearchPathForDirectoriesInDomains(
        .documentDirectory, .userDomainMask, true
    ).first!
    
    
    public static func GetDb() -> Connection? {
        do {
            let db = try Connection("\(path)/db.sqlite3")
            return db;
        }
        catch {
            print("Could not establish a connection.")
        }
        return nil
    }
}
