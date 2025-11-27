//
//  ProfileView.swift
//  WellnessHub
//
//  Created by Bishal Paudel on 11/26/25.
//

import SwiftUI

struct ProfileView: View {

    @State private var name: String = "Bishal"
    @State private var age: Int = 23
    @State private var favoriteActivity: String = "Yoga"
    @State private var isEditing = false

    var body: some View {
        ScrollView {
            VStack(spacing: 25) {

                // Profile Image
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .frame(width: 140, height: 140)
                    .foregroundColor(.blue)
                    .padding(.top, 20)

                // Profile Info Card
                VStack(alignment: .leading, spacing: 18) {

                    if isEditing {
                        TextField("Name", text: $name)
                            .textFieldStyle(RoundedBorderTextFieldStyle())

                        Stepper("Age: \(age)", value: $age, in: 10...100)

                        TextField("Favorite Activity", text: $favoriteActivity)
                            .textFieldStyle(RoundedBorderTextFieldStyle())

                    } else {
                        Text("\(name), \(age)")
                            .font(.title2)
                            .bold()

                        HStack {
                            Image(systemName: "heart.fill")
                                .foregroundColor(.red)
                            Text("Favorite Activity: \(favoriteActivity)")
                                .font(.body)
                        }
                    }
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color(.systemGray6))
                .cornerRadius(20)
                .shadow(color: .black.opacity(0.05), radius: 6, y: 4)
                .padding(.horizontal)

                // Edit Button
                Button(action: { isEditing.toggle() }) {
                    Text(isEditing ? "Save Profile" : "Edit Profile")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(isEditing ? Color.green.opacity(0.3)
                                              : Color.blue.opacity(0.3))
                        .cornerRadius(12)
                }
                .padding(.horizontal)

                Spacer()
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
