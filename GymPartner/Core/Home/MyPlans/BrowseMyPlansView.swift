//
//  BrowseMyPlansView.swift
//  GymPartner
//
//  Created by Klaudiusz Mękarski on 23/11/2023.
//

import SwiftUI

struct BrowseMyPlansView: View {
    @EnvironmentObject var homeVM: HomeViewModel
    @EnvironmentObject var viewPlanVM: ViewPlanViewModel
    
    var testPlan = Plan(id: "1", name: "Full Body Workout", days: [
        PlanDay(name: "Day 1"),
        PlanDay(name: "Day 2"),
    ], tags: [.beginner, .strength], authorName: "some user", authorPhotoUrl: "")
    
    var body: some View {
        ScrollView {
            VStack {
                header
                
                Divider()
                
                VStack {
                    sectionHeader("Your recent workout:")
                    PlanRowView(plan: testPlan)
                        .onTapGesture {
                            viewPlanVM.selectPlan(testPlan)
                            homeVM.myPlansState = .viewPlanDetails
                        }
                }
                .padding(.vertical)

                Divider()

                
                VStack {
                    sectionHeader("Your workout plans:")
                    VStack(spacing: 10) {
                        ForEach(homeVM.userPlans) { plan in
                            PlanRowView(plan: plan)
                                .background(Color(.systemGray5))
                            .cornerRadius(10)
                        }
                    }
                }
                .padding(.vertical)
            }
            .padding()
        }
    }
}

struct BrowseMyPlansView_Previews: PreviewProvider {
    static var previews: some View {
        BrowseMyPlansView()
            .environmentObject(dev.homeViewModel)
            .environmentObject(dev.viewPlanViewModel)
    }
}

extension BrowseMyPlansView {
    private var header: some View {
        VStack {
            HStack {
                RoundedSquareButton(systemName: "info")
                    .frame(width: 50, height: 50)
                    .opacity(0)
                Spacer()
                Text("Choose a workout plan")
                    .font(.system(size: 32, weight: .semibold))
                    .multilineTextAlignment(.center)
                Spacer()
                Button {
                    homeVM.myPlansState = .createInitial
                } label: {
                    RoundedSquareButton(systemName: "plus", border: true)
                        .frame(width: 50, height: 50)
                }

            }
            Text("based on your goal")
                .font(.system(size: 20, weight: .regular))
                .frame(maxWidth: .infinity, alignment: .center)
        }
    }
    
    private func sectionHeader(_ title: String) -> some View {
        Text(title)
            .font(.system(size: 24, weight: .semibold))
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}
