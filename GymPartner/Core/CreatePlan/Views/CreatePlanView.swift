//
//  CreatePlanView.swift
//  GymPartner
//
//  Created by Klaudiusz Mękarski on 22/11/2023.
//

import SwiftUI

struct CreatePlanView: View {
    @EnvironmentObject var createPlanVM: CreatePlanViewModel
    @EnvironmentObject var homeVM: HomeViewModel
    
    @State var selectedTags: [String] = []
    @State var days: [String] = []
    @State var exercises: [Exercise] = []
    @State var showNewDayModal: Bool = false
    @State var newDayName: String = ""
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                VStack {
                    header
                    RegularTextField(title: "Plan name", text: $homeVM.newPlanName)
                        .padding(.bottom)
                    TagsButtonsGroupView(geometry: geometry, selectedTags: $selectedTags)
                        Text("Only 3 tags can be selected")
                            .foregroundColor(.red)
                            .opacity(selectedTags.count > 3 ? 1.0 : 0.0)
                    Divider()
                    if days.isEmpty {
                        noDaysMessage
                    } else {
                        DaysOfPlanView(days: $days)
                    }
                    Spacer()
                }
                .padding()
                if !days.isEmpty {
                    DayActionBarView()
                }
                ModalWithTextField(title: "New day", placeholder: "Day name", text: $newDayName, isShowing: $showNewDayModal) {
                    days.append(newDayName)
                }
            }
        }
        
    }
}

struct CreatePlanView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            CreatePlanView()
                .environmentObject(dev.homeViewModel)
                .environmentObject(dev.createPlanViewModel)
        }
    }
}

extension CreatePlanView {
    private var temp: some View {
        VStack {
            HStack {
                Text("Create plan")
                Button("Back") {
                    homeVM.myPlansState = .browse
                }
            }
            
            TextField("Exercise name or body part", text: $createPlanVM.exerciseQuery)
            Picker("Body part", selection: $createPlanVM.selectedBodyPart) {
                ForEach(BodyPart.allCases, id: \.self) { bodyPart in
                    Text(bodyPart.rawValue.capitalized)
                }
            }
            VStack {
                ForEach(createPlanVM.filteredExercises) { exercise in
                    Text(exercise.name)
                }
            }
        }
        .padding()
    }
    
    private var header: some View {
        HStack {
            Button {
                
            } label: {
                RoundedSquareButton(systemName: "xmark", border: true)
                    .frame(width: 50, height: 50)
            }
            Spacer()
            Text("Create a workout plan")
                .font(.system(size: 32, weight: .semibold))
                .multilineTextAlignment(.center)
            Spacer()
            Button {
                
            } label: {
                RoundedSquareButton(systemName: "checkmark", border: true)
                    .frame(width: 50, height: 50)
            }
            
        }
    }
    
    private var noDaysMessage: some View {
        VStack {
            Button {
                showNewDayModal = true
            } label: {
                HStack {
                    Image(systemName: "plus")
                    Text("Add first day of your plan")
                    .font(.system(size: 16, weight: .semibold))
                }
                .padding()
                .background(Color(.systemGray5))
                .cornerRadius(16, corners: .allCorners)
            }
        }
        .frame(width: 250, height: 350)

    }
    
    private var noExercisesMessage: some View {
        Text("Lets add some exercises")
            .frame(width: 250, height: 350)
            .font(.system(size: 20, weight: .semibold))
    }
}
