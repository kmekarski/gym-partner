//
//  HistoryView.swift
//  GymPartner
//
//  Created by Klaudiusz Mękarski on 22/11/2023.
//

import SwiftUI

struct HistoryView: View {
    let workoutInHistory = WorkoutInHistory(
        id: "1",
        name: "Push day",
        planName: "Intermediate FBW",
        numberOfExercises: 10,
        numberOfSets: 18,
        date: Date(),
        timeInSeconds: 3600 - 180)
    
    var body: some View {
        ScrollView {
            VStack {
                header
                statCircles
                VStack {
                    ZStack {
                        Color(.systemGray5)
                            .cornerRadius(10)
                        VStack(spacing: 10) {
                            HistoryRowView(workout: workoutInHistory)
                            Divider()
                            HistoryRowView(workout: workoutInHistory)
                            Divider()
                            HistoryRowView(workout: workoutInHistory)
                            Divider()
                        }
                        .padding()
                    }
                }
                .padding()
                
            }
            .padding(.vertical)
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}

extension HistoryView {
    private var header: some View {
        VStack(spacing: 8) {
            Text("Your workout history")
                .font(.system(size: 32, weight: .semibold))
                .multilineTextAlignment(.center)
        }
    }
    
    private var statCircles: some View {
        HStack(spacing: 20) {
            statCircle(title: "In total", value: 3)
            statCircle(title: "This month", value: 3)
            statCircle(title: "This week", value: 3)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color(.systemGray5))
    }
    
    private func statCircle(title: String, value: Int) -> some View {
        VStack {
            ZStack {
                Circle()
                    .frame(width: 80)
                    .foregroundColor(Color(.systemGray6))
                .shadow(color: .theme.border, radius: 1, x: 0, y: 0)
                Text("\(value)")
                    .font(.system(size: 32, weight: .semibold))
            }
            Text(title)
                .font(.system(size: 14, weight: .semibold))
        }
    }
}
