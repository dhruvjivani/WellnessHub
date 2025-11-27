//
//  ProfileView.swift
//  WellnessHub
//
//  Created by Dhruv Rasikbhai Jivani on 11/26/25.
//

import SwiftUI

struct ProfileView: View {
    
    // Toggles edit mode on/off
    @State private var isEditing = false
    
    // User profile values
    @State private var name = "Dhruv"
    @State private var age = "20"
    @State private var favoriteActivity = "Yoga"
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                
                VStack(spacing: 30) {
                    
                    // Top header with gradient + profile photo
                    ZStack {
                        LinearGradient(
                            colors: [.teal.opacity(0.9), .blue.opacity(0.8)],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                        .frame(height: 240)
                        .cornerRadius(30)
                        .shadow(color: .black.opacity(0.15), radius: 10)
                        .padding(.horizontal)
                        
                        // Profile image + name
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
                    
                    
                    // Information card with editable fields
                    VStack(spacing: 22) {
                        
                        profileField(icon: "person.fill", title: "Name", value: $name, isEditing: isEditing)
                        profileField(icon: "clock.fill", title: "Age", value: $age, isEditing: isEditing)
                        profileField(icon: "heart.fill", title: "Favorite Activity", value: $favoriteActivity, isEditing: isEditing)
                        
                    }
                    .padding(22)
                    .background(.ultraThinMaterial)
                    .cornerRadius(25)
                    .shadow(color: .black.opacity(0.08), radius: 10)
                    .padding(.horizontal)
                    
                    
                    // Button to switch between edit/save
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
    
    // Reusable field component for Name/Age/Activity
    @ViewBuilder
    func profileField(icon: String, title: String, value: Binding<String>, isEditing: Bool) -> some View {
        
        VStack(alignment: .leading, spacing: 6) {
            
            // Icon + Section Title
            HStack(spacing: 12) {
                Image(systemName: icon)
                    .font(.title3)
                    .foregroundColor(.teal)
                
                Text(title)
                    .font(.headline)
            }
            
            // Edit vs Display mode
            if isEditing {
                TextField("Enter \(title.lowercased())", text: value)
                    .padding(12)
                    .background(Color.white.opacity(0.9))
                    .cornerRadius(12)
            } else {
                Text(value.wrappedValue)
                    .font(.title3)
                    .padding(.leading, 4)
            }
        }
        .padding()
        .background(Color.white.opacity(0.75))
        .cornerRadius(18)
        .shadow(color: .black.opacity(0.05), radius: 4)
    }
}
