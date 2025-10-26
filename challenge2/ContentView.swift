//
//  OnboardingView.swift
//  challenge2
//
//  Created by sarah alfarawi on 20/10/2025.
//

import SwiftUI
struct StartView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 40) {
         
                // 🔸 الزر اللي يوديك لصفحة ActivityView
                NavigationLink(destination: ActivityView()) {
                    Text("Start learning")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.orange)
                        .cornerRadius(30)
                        .padding(.horizontal, 40)
                }
            }
        }
    }
}

struct OnboardingView: View {
    @State private var topic: String = "Swift"
    @State private var selectedDuration: String = "Week"
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack(spacing: 40) {
                // Logo
                Image(systemName: "flame.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.orange)
                    .padding(.top, 80)
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("Hello Learner")
                        .font(.system(size: 28, weight: .bold))
                        .foregroundColor(.white)
                    
                    Text("This app will help you learn everyday!")
                        .font(.system(size: 16))
                        .foregroundColor(.gray)
                }
                
                VStack(alignment: .leading, spacing: 20) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("I want to learn")
                            .foregroundColor(.white)
                        
                        TextField("Enter topic", text: $topic)
                            .padding(.vertical, 10)
                            .padding(.horizontal)
                            .background(Color.black)
                            .overlay(
                                Rectangle()
                                    .frame(height: 1)
                                    .foregroundColor(.gray),
                                alignment: .bottom
                            )
                            .foregroundColor(.white)
                    }
                    
                    VStack(alignment: .leading, spacing: 12) {
                        Text("I want to learn it in a")
                            .foregroundColor(.white)
                        
                        HStack(spacing: 16) {
                            ForEach(["Week", "Month", "Year"], id: \.self) { duration in
                                Button(action: {
                                    selectedDuration = duration
                                }) {
                                    Text(duration)
                                        .fontWeight(.semibold)
                                        .padding(.vertical, 10)
                                        .padding(.horizontal, 24)
                                        .background(selectedDuration == duration ? Color.orange : Color(.darkGray))
                                        .foregroundColor(.white)
                                        .cornerRadius(25)
                                }
                            }
                        }
                    }
                }
                
                Spacer()
                
                Button(action: {print("Start learning")} ) {
                    Text("Start learning")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.orange)
                        .cornerRadius(30)
                        .padding(.horizontal, 40)
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    OnboardingView()
}
