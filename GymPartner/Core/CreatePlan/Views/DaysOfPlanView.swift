//
//  DaysOfPlanView.swift
//  GymPartner
//
//  Created by Klaudiusz Mękarski on 23/11/2023.
//

import SwiftUI

struct DaysOfPlanView: View {
    @Binding var days: [String]
    @State var selectedDay: String?
    var body: some View {
        ScrollViewReader { scrollProxy in
            VStack {
                HStack {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(days.indices, id: \.self) { index in
                                dayText(day: days[index])
                            }
                        }
                        .padding(.vertical)
                    }
                    Button {
                        newDay(name: "day \(days.count + 1)")
                    } label: {
                        newDayButton
                    }
                    
                }
                .padding(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
            }
            .onChange(of: days, perform: { newValue in
                withAnimation() {
                    scrollProxy.scrollTo(days.count - 1)
                }
            })
            .onAppear() {
                if let firstDay = days.first {
                    selectedDay = firstDay
                }
            }
        }
    }
}

struct DaysOfPlanView_Previews: PreviewProvider {
    static var previews: some View {
        DaysOfPlanView(days: .constant(["Day 1", "Day 2"]))
    }
}

extension DaysOfPlanView {
    private var newDayButton: some View {
        Text("New day")
            .padding(.vertical, 8)
            .padding(.horizontal)
            .foregroundColor(.white)
            .background(Color.theme.accent)
            .cornerRadius(16, corners: [.topLeft, .bottomLeft])
    }
    
    private func dayText(day: String) -> some View {
        Text(day)
            .id(day)
            .foregroundColor(day == selectedDay ? .primary : .theme.secondaryText)
            .onTapGesture {
                withAnimation() {
                    selectedDay = day
                }
            }
            .overlay(
                Rectangle()
                    .foregroundColor(day == selectedDay ? .theme.accent : .clear)
                    .frame(height: 2)
                    .offset(x: 0, y: 20)
            )
    }
    
    private func newDay(name: String) {
        days.append(name)
        if let lastDay = days.last {
            selectedDay = lastDay
        }
    }
}
