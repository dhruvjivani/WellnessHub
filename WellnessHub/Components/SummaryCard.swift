//
//  SummaryCard.swift
//  WellnessHub
//
//  Created by Dhruv Rasikbhai Jivani on 11/26/25.
//

import SwiftUI

struct SummaryCard: View {
    let steps: Int
    let water: Int

    var body: some View {
        VStack(spacing: 12) {
            Text("Today's Progress")
                .font(.headline)

            HStack {
                VStack {
                    Text("Steps")
                    Text("\(steps)%")
                        .font(.title.bold())
                        .foregroundColor(.teal)
                }.frame(maxWidth: .infinity)

                VStack {
                    Text("Water")
                    Text("\(water)%")
                        .font(.title.bold())
                        .foregroundColor(.blue)
                }.frame(maxWidth: .infinity)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(14)
        .shadow(radius: 5)
    }
}
