//
//  MainView.swift
//  TimeLogger
//
//  Created by Carlos Evelo on 9/28/23.
//

import SwiftUI

struct MainView: View {
    //@Environment var State: TimeLoggerState
    
    var body: some View {
        TabView {
            LogView()
                .tabItem {
                    Image(systemName: "house")
                }
                .clipped()
            ReportsView()
                .tabItem {
                    Image(systemName: "newspaper.fill")
                }
            SettingsView()
                .tabItem {
                    Image(systemName: "gearshape.fill")
                }
                .clipped()
        }
        .toolbar(.visible, for: .tabBar)
        .toolbarBackground(Color.gray, for: .tabBar)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
