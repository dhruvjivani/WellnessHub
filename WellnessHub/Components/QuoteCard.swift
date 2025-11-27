//
//  QuoteCard.swift
//  WellnessHub
//
//  Created by Dhruv Rasikbhai Jivani on 11/26/25.
//

import SwiftUI

struct QuoteCard: View {
    let quote: String
    let author: String

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(quote)
                .font(.title3)
                .italic()
                .foregroundColor(.white)
            Text(author)
                .font(.caption)
                .foregroundColor(.white.opacity(0.8))
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            LinearGradient(
                colors: [.teal, .blue],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .cornerRadius(14)
        .shadow(radius: 5)
    }
}
