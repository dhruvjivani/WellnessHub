//
//  TrackerView.swift
//  WellnessHub
//
//  Created by Bishal Paudel on 11/26/25.
//

import SwiftUI

struct TrackerView: View {

    @State private var waterIntake: Double = 0
    @State private var sleepHours: Int = 8
    @State private var mood: String = "🙂"
    @State private var exerciseDone: Bool = false

    @State private var showAlert = false

    let moodOptions = ["😡", "😐", "🙂", "😄", "🤩"]

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {

                Form {

                    // WATER
                    Section(header: Text("Hydration")) {
                        VStack(alignment: .leading) {
                            Slider(value: $waterIntake, in: 0...20, step: 1)
                            Text("Water: \(Int(waterIntake)) cups")
                                .foregroundColor(.secondary)
                        }
                    }

                    // SLEEP
                    Section(header: Text("Sleep")) {
                        Stepper("\(sleepHours) hours", value: $sleepHours, in: 0...12)
                    }

                    // MOOD
                    Section(header: Text("Mood")) {
                        Picker("Mood", selection: $mood) {
                            ForEach(moodOptions, id: \.self) { face in
                                Text(face).tag(face)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }

                    // EXERCISE
                    Section(header: Text("Exercise")) {
                        Toggle("Exercise Completed?", isOn: $exerciseDone)
                    }

                    // SUBMIT
                    Section {
                        Button(action: submitData) {
                            HStack {
                                Image(systemName: "paperplane.fill")
                                Text("Submit Today’s Data")
                                    .bold()
                            }
                            .foregroundColor(.blue)
                        }
                    }
                }
            }
            .navigationTitle("Daily Tracker")
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Success!"),
                      message: Text("Your daily wellness input was saved."),
                      dismissButton: .default(Text("Great!")))
            }
        }
    }

    func submitData() {
        showAlert = true
        resetForm()
    }

    func resetForm() {
        waterIntake = 0
        sleepHours = 8
        mood = "🙂"
        exerciseDone = false
    }
}

struct TrackerView_Previews: PreviewProvider {
    static var previews: some View {
        TrackerView()
    }
}
