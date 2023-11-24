//
//  DaysOfPlanView.swift
//  GymPartner
//
//  Created by Klaudiusz Mękarski on 23/11/2023.
//

import SwiftUI

struct DaysOfPlanView: View {
    @EnvironmentObject var homeVM: HomeViewModel
    @Binding var showNewDayModal: Bool
    var body: some View {
        ScrollViewReader { scrollProxy in
            VStack {
                dayPicker
                if homeVM.noExercisesInSelectedDay() {
                    noExercisesMessage
                } else {
                    exerciseList
                }
            }
            .frame(height: .infinity)
            .onChange(of: homeVM.days, perform: { newValue in
                withAnimation() {
                    scrollProxy.scrollTo(homeVM.days.last?.id ?? "0")
                }
            })
        }
    }
}

struct DaysOfPlanView_Previews: PreviewProvider {
    static var previews: some View {
        CreatePlanView()
            .environmentObject(dev.homeViewModel)
            .environmentObject(dev.createPlanViewModel)
    }
}

extension DaysOfPlanView {
    
    private var dayPicker: some View {
        HStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(homeVM.days) { day in
                        dayText(day: day)
                    }
                }
                .padding(.vertical)
            }
            Button {
                homeVM.addNewDay(name: "day \(homeVM.days.count + 1)")
            } label: {
                newDayButton
            }
            
        }
        .padding(.leading)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var newDayButton: some View {
        Button {
            showNewDayModal = true
        } label: {
            Text("New day")
                .padding(.vertical, 8)
                .padding(.horizontal)
                .foregroundColor(.white)
                .background(Color.theme.accent)
                .cornerRadius(16, corners: [.topLeft, .bottomLeft])
        }
    }
    
    private var exerciseList: some View {
        ScrollView {
            VStack {
                ForEach(homeVM.selectedDayExercises()) { exercise in
                    ExerciseRowView(exercise: exercise)
                }
            }
        }
        .ignoresSafeArea()
    }
    
    private var noExercisesMessage: some View {
        VStack {
            Spacer()
            Button {
                homeVM.myPlansState = .selectExercise
            } label: {
                HStack {
                    Image(systemName: "plus")
                    Text("Let's add some exercises")
                        .font(.system(size: 16, weight: .semibold))
                }
                .padding()
                .background(Color(.systemGray5))
                .cornerRadius(16, corners: .allCorners)
            }
            Spacer()
        }
    }
    
    private func dayText(day: PlanDay) -> some View {
        Text(day.name)
            .id(day.id)
            .foregroundColor(homeVM.dayIsSelected(day: day) ? .primary : .theme.secondaryText)
            .onTapGesture {
                withAnimation() {
                    homeVM.selectedDay = day
                }
            }
            .overlay(
                Rectangle()
                    .foregroundColor(homeVM.dayIsSelected(day: day) ? .theme.accent : .clear)
                    .frame(height: 2)
                    .offset(x: 0, y: 20)
            )
    }
}
