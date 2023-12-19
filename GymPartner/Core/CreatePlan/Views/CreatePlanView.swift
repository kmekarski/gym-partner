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
    var isEditMode: Bool = false
    @State var exercises: [Exercise] = []
    @State var showNewDayModal: Bool = false
    @State var showRejectPlanModal: Bool = false
    @State var newDayName: String = ""
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                VStack {
                    header
                    RegularTextField(title: "Plan name", text: $homeVM.newPlanName)
                        .padding(.bottom)
                    TagsButtonsGroupView(geometry: geometry, selectedTags: $homeVM.tags)
                    Text("Only 3 tags can be selected")
                        .foregroundColor(.red)
                        .opacity(homeVM.tags.count > 3 ? 1.0 : 0.0)
                    Divider()
                    if homeVM.days.isEmpty {
                        noDaysMessage
                    } else {
                        DaysOfPlanView(showNewDayModal: $showNewDayModal)
                    }
                }
                .padding(.top)
                .padding(.horizontal)
                if !homeVM.days.isEmpty {
                    DayActionBarView()
                }
                ModalWithTextField(title: "New day", placeholder: "Day name", text: $newDayName, isShowing: $showNewDayModal) {
                    homeVM.addNewDay(name: newDayName)
                }
                ConfirmationModal(title: "Confirm", message: "Are you sure you want to reject this workout plan? Provided data will be lost.", isShowing: $showRejectPlanModal) {
                    homeVM.myPlansState = .browse
                }
            }
        }
        
    }
}

struct CreatePlanView_Previews: PreviewProvider {
    static var previews: some View {
        CreatePlanView()
            .environmentObject(dev.homeViewModel)
            .environmentObject(dev.createPlanViewModel)
    }
}

extension CreatePlanView {
    private var header: some View {
        HStack {
            Button {
                showRejectPlanModal = true
            } label: {
                RoundedSquareButton(systemName: "xmark", border: true)
                    .frame(width: 50, height: 50)
            }
            Spacer()
            Text(isEditMode ? "Edit a workout Plan" : "Create a workout plan")
                .font(.system(size: 32, weight: .semibold))
                .multilineTextAlignment(.center)
            Spacer()
            Button {
                Task {
                    do {
                        try await homeVM.savePlan()
                        homeVM.myPlansState = .browse
                    } catch {
                        print(error)
                    }
                }
            } label: {
                RoundedSquareButton(systemName: "checkmark", border: true)
                    .frame(width: 50, height: 50)
            }
            
        }
    }
    
    private var noDaysMessage: some View {
        VStack {
            Spacer()
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
            Spacer()
        }
    }
}
