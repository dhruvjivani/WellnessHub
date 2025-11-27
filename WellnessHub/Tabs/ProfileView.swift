//
//  ProfileView.swift
//  WellnessHub
//
//  Created by Dhruv Rasikbhai Jivani on 11/26/25.
//

import SwiftUI

struct ProfileView: View {
    
    @State private var isEditing = false
    
    @State private var name = "Dhruv"
    @State private var age = "20"
    @State private var favoriteActivity = "Yoga"
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                
                VStack(spacing: 30) {
                    
                    // MARK: - Top Gradient Header with Profile
                    ZStack {
                        LinearGradient(
                            colors: [.teal.opacity(0.9), .blue.opacity(0.8)],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                        .frame(height: 240)
                        .cornerRadius(30)
                        .shadow(color: .black.opacity(0.15), radius: 10, x: 0, y: 5)
                        .padding(.horizontal)
                        
                        VStack(spacing: 14) {
                            Image("profile_pic")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 150, height: 150)
                                .clipShape(Circle())
                                .overlay(
                                    Circle().stroke(Color.white, lineWidth: 5)
                                )
                                .shadow(radius: 10)
                            
                            Text(name)
                                .font(.largeTitle.bold())
                                .foregroundColor(.white)
                        }
                    }
                    .padding(.top, 10)
                    
                    
                    // MARK: - Information Card
                    VStack(spacing: 22) {
                        
                        // Name
                        profileField(
                            icon: "person.fill",
                            title: "Name",
                            value: $name,
                            isEditing: isEditing
                        )
                        
                        // Age
                        profileField(
                            icon: "clock.fill",
                            title: "Age",
                            value: $age,
                            isEditing: isEditing
                        )
                        
                        // Favorite Activity
                        profileField(
                            icon: "heart.fill",
                            title: "Favorite Activity",
                            value: $favoriteActivity,
                            isEditing: isEditing
                        )
                        
                    }
                    .padding(22)
                    .background(.ultraThinMaterial)
                    .cornerRadius(25)
                    .shadow(color: .black.opacity(0.08), radius: 10, x: 0, y: 5)
                    .padding(.horizontal)
                    
                    
                    // MARK: - Edit Button
                    Button(action: {
                        withAnimation(.easeInOut(duration: 0.25)) {
                            isEditing.toggle()
                        }
                    }) {
                        Text(isEditing ? "Save Changes" : "Edit Profile")
                            .font(.headline)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.white)
                            .background(
                                LinearGradient(
                                    colors: isEditing ? [.green, .teal] : [.blue, .teal],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                            .cornerRadius(16)
                            .padding(.horizontal)
                            .shadow(radius: 5)
                    }
                    
                    Spacer(minLength: 40)
                }
                .padding(.bottom)
            }
            .navigationTitle("Profile")
        }
    }
    
    
    // MARK: - Reusable Field Component
    @ViewBuilder
    func profileField(icon: String, title: String, value: Binding<String>, isEditing: Bool) -> some View {
        
        VStack(alignment: .leading, spacing: 6) {
            
            HStack(spacing: 12) {
                Image(systemName: icon)
                    .font(.title3)
                    .foregroundColor(.teal)
                
                Text(title)
                    .font(.headline)
                    .foregroundColor(.primary)
            }
            
            if isEditing {
                TextField("Enter \(title.lowercased())", text: value)
                    .padding(12)
                    .background(Color.white.opacity(0.9))
                    .cornerRadius(12)
                    .shadow(color: .black.opacity(0.07), radius: 3, x: 0, y: 2)
            } else {
                Text(value.wrappedValue)
                    .font(.title3)
                    .foregroundColor(.primary.opacity(0.9))
                    .padding(.vertical, 4)
                    .padding(.leading, 4)
            }
        }
        .padding()
        .background(Color.white.opacity(0.75))
        .cornerRadius(18)
        .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 3)
    }
}
