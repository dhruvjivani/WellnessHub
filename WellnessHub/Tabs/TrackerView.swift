//
//  TrackerView.swift
//  WellnessHub
//
//  Created by Dhruv Rasikbhai Jivani on 11/26/25.
//

import SwiftUI

struct TrackerView: View {

    // Input values for the form
    @State private var water: Double = 4
    @State private var sleep: Int = 7
    @State private var mood: String = "😊"
    @State private var exercised: Bool = false

    // Alert for submission
    @State private var showAlert = false

    // Mood options displayed in picker
    let moods = ["😐", "😊", "😁", "😢", "😡"]

    var body: some View {

        NavigationView {
            Form {

                // Water intake slider
                Section(header: Text("Water Intake (cups)")) {
                    Slider(value: $water, in: 0...20, step: 1)
                    Text("\(Int(water)) cups")
                }

                // Sleep hours stepper
                Section(header: Text("Sleep Hours")) {
                    Stepper(value: $sleep, in: 0...12) {
                        Text("\(sleep) hours")
                    }
                }

                // Mood picker using emojis
                Section(header: Text("Mood")) {
                    Picker("Mood", selection: $mood) {
                        ForEach(moods, id: \.self) { value in
                            Text(value)
                        }
                    }
                }

                // Exercise toggle
                Section {
                    Toggle("Did you exercise today?", isOn: $exercised)
                }

                // Submit button
                Button(action: handleSubmit) {
                    Text("Submit Day")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.teal)
                        .cornerRadius(10)
                }
                .padding(.vertical)
            }
            .navigationTitle("Daily Tracker")
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Wellness Saved ✨"),
                      message: Text("Keep up the great habits!"),
                      dismissButton: .default(Text("OK")))
            }
        }
    }

    // Handles form submission and resets fields
    func handleSubmit() {
        showAlert = true
        
        // Reset input values
        water = 0
        sleep = 0
        mood = "😊"
        exercised = false
    }
}
