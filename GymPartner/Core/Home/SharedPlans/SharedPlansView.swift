//
//  SharedPlansView.swift
//  GymPartner
//
//  Created by Klaudiusz Mękarski on 22/11/2023.
//

import SwiftUI

struct SharedPlansView: View {
    
    var testPlan = Plan(id: "1", name: "Full Body Workout", days: [
        PlanDay(id: "1", name: "Day 1"),
        PlanDay(id: "2", name: "Day 2"),
    ], tags: [.beginner, .strength], authorName: "someUser123", authorPhotoUrl: "https://fastly.picsum.photos/id/567/96/96.jpg?hmac=2t58DxDsk0q6eabOjL-zmUFQQwyCVq5Ryc7aUzYb5sA")
    
    var body: some View {
        ScrollView {
            VStack {
                header
                Divider()
                VStack {
                    sectionHeader("Other users' workout plans:")
                    VStack(spacing: 10) {
                        UserPlanRowView(plan: testPlan)
                            .background(Color(.systemGray5))
                            .cornerRadius(10)
                        UserPlanRowView(plan: testPlan)
                            .background(Color(.systemGray5))
                            .cornerRadius(10)
                        UserPlanRowView(plan: testPlan)
                            .background(Color(.systemGray5))
                            .cornerRadius(10)
                    }
                }
                .padding(.vertical)
            }
            .padding()
        }
    }
}

struct SharedPlansView_Previews: PreviewProvider {
    static var previews: some View {
        SharedPlansView()
    }
}

extension SharedPlansView {
    private var header: some View {
        VStack(spacing: 8) {
            Text("Shared plans")
                .font(.system(size: 32, weight: .semibold))
                .multilineTextAlignment(.center)
            Text("learn from the experienced")
                .font(.system(size: 20, weight: .regular))
                .frame(width: 220)
                .multilineTextAlignment(.center)
        }
    }
    
    private func sectionHeader(_ title: String) -> some View {
        Text(title)
            .font(.system(size: 24, weight: .semibold))
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}
