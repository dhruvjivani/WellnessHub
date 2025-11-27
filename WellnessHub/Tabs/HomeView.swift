//
//  HomeView.swift
//  WellnessHub
//
//  Created by Dhruv Rasikbhai Jivani on 11/26/25.
//

import SwiftUI

struct HomeView: View {

    // Hardcoded demo data
    let name = "Dhruv"
    let stepsPercent = 75
    let waterPercent = 50

    var body: some View {

        ScrollView {
            VStack(spacing: 20) {
                
                // Greeting message
                Text("Welcome, \(name)! 🌿")
                    .font(.largeTitle.bold())
                    .foregroundColor(.teal)
                    .padding(.top, 20)

                // Motivational quote card
                QuoteCard(
                    quote: "Small daily habits lead to big transformations.",
                    author: "– WellnessHub"
                )

                // Daily progress summary card
                SummaryCard(
                    steps: stepsPercent,
                    water: waterPercent
                )

                // Background wellness image
                Image("nature_bg")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(16)
                    .shadow(radius: 10)
                    .padding()
            }
            .padding()
        }
        .background(Color(.systemGray6))
    }
}
