//
//  SummaryCard.swift
//  WellnessHub
//
//  Created by Dhruv Rasikbhai Jivani on 11/26/25.
//

import SwiftUI

struct SummaryCard: View {
    // Percent values for steps and water
    let steps: Int
    let water: Int

    var body: some View {
        VStack(spacing: 12) {
            
            // Title
            Text("Today's Progress")
                .font(.headline)

            // Two-column summary layout
            HStack {
                VStack {
                    Text("Steps")
                    Text("\(steps)%")
                        .font(.title.bold())
                        .foregroundColor(.teal)
                }
                .frame(maxWidth: .infinity)

                VStack {
                    Text("Water")
                    Text("\(water)%")
                        .font(.title.bold())
                        .foregroundColor(.blue)
                }
                .frame(maxWidth: .infinity)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(14)
        .shadow(radius: 5)
    }
}
