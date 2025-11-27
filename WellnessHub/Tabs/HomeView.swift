//
//  HomeView.swift
//  WellnessHub
//
//  Created by Bishal Paudel on 11/26/25.
//

import SwiftUI

struct HomeView: View {

    // FIXED: Added actual values
    let user = UserModel(name: "Bishal", age: 23, favoriteActivity: "Yoga")

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 25) {

                // Header
                VStack(alignment: .leading, spacing: 8) {
                    Text("Welcome back,")
                        .font(.title3)
                        .foregroundColor(.secondary)

                    Text(user.name)
                        .font(.largeTitle)
                        .bold()
                }
                .padding(.horizontal)

                // Motivational Quote Card
                VStack(alignment: .leading, spacing: 10) {
                    Text("✨ Daily Motivation")
                        .font(.headline)

                    Text("“Take care of your body. It's the only place you have to live.”")
                        .font(.body)
                        .italic()
                        .foregroundColor(.secondary)
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(16)
                .shadow(color: .black.opacity(0.05), radius: 6, y: 3)
                .padding(.horizontal)

                // Summary Card
                VStack(alignment: .leading, spacing: 12) {
                    Text("Today's Wellness Summary")
                        .font(.headline)

                    HStack {
                        summaryIcon(title: "Steps", value: "75%", iconName: "figure.walk")
                        summaryIcon(title: "Water", value: "50%", iconName: "drop.fill")
                        summaryIcon(title: "Exercise", value: "Done", iconName: "checkmark.circle.fill")
                    }
                }
                .padding()
                .background(
                    LinearGradient(colors: [.blue.opacity(0.3), .blue.opacity(0.1)],
                                   startPoint: .topLeading,
                                   endPoint: .bottomTrailing)
                )
                .cornerRadius(16)
                .shadow(color: .blue.opacity(0.15), radius: 8, y: 4)
                .padding(.horizontal)

                // Image
                Image(systemName: "leaf.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200)
                    .foregroundColor(.green)
                    .padding()
                    .frame(maxWidth: .infinity)
            }
            .padding(.vertical)
        }
    }

    // Card Icon Helper
    func summaryIcon(title: String, value: String, iconName: String) -> some View {
        VStack(spacing: 6) {
            Image(systemName: iconName)
                .font(.largeTitle)
                .foregroundColor(.blue)

            Text(title)
                .font(.subheadline)

            Text(value)
                .font(.headline)
                .bold()
        }
        .frame(maxWidth: .infinity)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
