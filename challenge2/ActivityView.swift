//
//  ContentView 2.swift
//  challenge2
//
//  Created by sarah alfarawi on 21/10/2025.
//

import SwiftUI

struct ActivityView: View {
    @State private var selectedDay: Int? = nil
    @State private var learnedDays = 3
    @State private var frozenDays = 1
    @State private var isLearnedToday = false
    @State private var isFrozenToday = false
    @State private var freezeLimit = 2

    let days = Array(20...26)
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack(spacing: 24) {
                // MARK: - العنوان
                Text("Activity")
                    .font(.system(size: 34, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    .foregroundColor(.white)
                
                // MARK: - التقويم
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        Text("October 2025")
                            .font(.headline)
                            .foregroundColor(.white)
                        Spacer()
                    }
                    
                    // الأيام
                    HStack(spacing: 10) {
                        ForEach(days, id: \.self) { day in
                            Circle()
                                .fill(circleColor(for: day))
                                .frame(width: 36, height: 36)
                                .overlay(Text("\(day)").foregroundColor(.white))
                                .onTapGesture {
                                    selectedDay = day
                                }
                        }
                    }
                    
                    // الإحصائيات
                    HStack(spacing: 20) {
                        Label("\(learnedDays) Days Learned", systemImage: "flame.fill")
                            .foregroundColor(.orange)
                        
                        Label("\(frozenDays) Day Freezed", systemImage: "snowflake")
                            .foregroundColor(.blue)
                    }
                }
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(16)
                .padding(.horizontal)
                
                Spacer()
                
                // MARK: - الزر الرئيسي
                VStack(spacing: 16) {
                    if isLearnedToday {
                        Circle()
                            .fill(Color.orange.opacity(0.15))
                            .frame(width: 220, height: 220)
                            .overlay(Text("Learned Today").foregroundColor(.orange).font(.title))
                    } else if isFrozenToday {
                        Circle()
                            .fill(Color.blue.opacity(0.15))
                            .frame(width: 220, height: 220)
                            .overlay(Text("Day Freezed").foregroundColor(.blue).font(.title))
                    } else {
                        Circle()
                            .fill(Color.orange)
                            .frame(width: 220, height: 220)
                            .overlay(Text("Log as Learned")
                                .font(.title)
                                .foregroundColor(.white))
                            .onTapGesture {
                                logAsLearned()
                            }
                    }
                    
                    // زر التجميد
                    Button(action: {
                        logAsFrozen()
                    }) {
                        Text("Log as Freezed")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue.opacity(0.6))
                            .cornerRadius(12)
                    }
                    .padding(.horizontal)
                    
                    Text("\(frozenDays) out of \(freezeLimit) Freezes used")
                        .foregroundColor(.gray)
                        .font(.caption)
                }
                
                Spacer()
            }
        }
    }
    
    // MARK: - دوال المساعدة
    private func logAsLearned() {
        guard !isLearnedToday else { return }
        isLearnedToday = true
        learnedDays += 1
        isFrozenToday = false
    }
    
    private func logAsFrozen() {
        guard frozenDays < freezeLimit, !isFrozenToday else { return }
        isFrozenToday = true
        frozenDays += 1
        isLearnedToday = false
    }
    
    private func circleColor(for day: Int) -> Color {
        if day == 24 && isLearnedToday { return .orange }
        if day == 24 && isFrozenToday { return .blue }
        return Color.gray.opacity(0.3)
    }
}

#Preview {
    ActivityView()
}
