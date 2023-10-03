//
//  SettingsView.swift
//  TimeLogger
//
//  Created by Carlos Evelo on 9/28/23.
//

import SwiftUI

struct SettingsView: View {
    var settingsViewModel = SettingsViewModel()
    
    var body: some View {
        Button(action: {
            settingsViewModel.BuildDb()
        }, label: {
            /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
        })
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
