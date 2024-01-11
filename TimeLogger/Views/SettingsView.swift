//
//  SettingsView.swift
//  TimeLogger
//
//  Created by Carlos Evelo on 9/28/23.
//

import SwiftUI
import SwiftData

struct SettingsView: View {
    @Environment(\.modelContext) var context: ModelContext
    
    var body: some View {
        VStack {
            Button("Clear Logging History") {
                do {
                    try context.delete(model: TimeEntry.self)
                } catch {
                    fatalError(error.localizedDescription)
                }
            }
            .buttonStyle(.plain)
            .foregroundStyle(.red)
            .padding(.vertical)
            Spacer()
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
