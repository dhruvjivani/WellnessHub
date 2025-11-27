//
//  ContentView.swift
//  WellnessHub
//
//  Created by Dhruv Rasikbhai Jivani on 11/26/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            
            TrackerView()
                .tabItem {
                    Label("Tracker", systemImage: "chart.bar.fill")
                }
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.crop.circle.fill")
                }
        }
        .accentColor(.teal)
    }
}
