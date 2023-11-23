//
//  HistoryRowView.swift
//  GymPartner
//
//  Created by Klaudiusz Mękarski on 23/11/2023.
//

import SwiftUI

struct HistoryRowView: View {
    let dateFormatter = DateFormatter()
    var workout: WorkoutInHistory

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("\(workout.date.full)")
                Spacer()
                Button {
                    
                } label: {
                    Image(systemName: "xmark")
                        .fontWeight(.semibold)
                        .foregroundColor(.theme.secondaryText)
                }
            }
            .font(.system(size: 12, weight: .regular))
            .padding(.bottom, 4)


            HStack(alignment: .bottom) {
                VStack(alignment: .leading, spacing: 4) {
                    Text(workout.planName)
                        .font(.system(size: 18, weight: .semibold))
                    Text(workout.name)
                        .font(.system(size: 16, weight: .regular))
                }
                Spacer()
                HStack {
                    StatView(name: "Exercises", value: "\(workout.numberOfExercises)")
                    StatView(name: "Sets", value: "\(workout.numberOfSets)")
                    StatView(name: "Time", value: "\(workout.timeInSeconds.timeFormat)")
                }
            }
        }
        .padding(.vertical, 8)
    }
}

struct HistoryRowView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            HistoryRowView(workout: dev.workoutInHistory)
            Divider()
            HistoryRowView(workout: dev.workoutInHistory)
        }
        .padding(.horizontal)
    }
}

private struct StatView: View {
    var name: String
    var value: String
    var body: some View {
        VStack(spacing: 8) {
            Text(name)
                .font(.system(size: 12, weight: .regular))
            Text(value)
                .font(.system(size: 16, weight: .semibold))
        }
        .frame(width: 60)
    }
}
