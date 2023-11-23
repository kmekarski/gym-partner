//
//  PlanRowView.swift
//  GymPartner
//
//  Created by Klaudiusz Mękarski on 23/11/2023.
//

import SwiftUI

struct PlanRowView: View {
    var plan: Plan
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Text(plan.name)
                    .font(.system(size: 24, weight: .regular))
                    .frame(width: 230, alignment: .leading)
                Spacer()
                HStack {
                    Image(systemName: "calendar")
                    Text("\(plan.days.count)")
                }
                .font(.system(size: 24, weight: .light))
                .frame(width: 50, alignment: .trailing)
                
            }
            HStack(spacing: 10) {
                ForEach(plan.tags, id: \.self) { tag in
                    PlanTagView(tag: tag)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
        }
        .padding()
    }
}

struct PlanRowView_Previews: PreviewProvider {
    static let days1 = [
        PlanDay(id: "1", name: "Day 1"),
        PlanDay(id: "2", name: "Day 3"),
        PlanDay(id: "3", name: "Day 4")
    ]
    static let days2 = [
        PlanDay(id: "1", name: "Day 1")
    ]
    static let tags1: [PlanTag] = [.expert, .strength, .cardio]
    static let tags2: [PlanTag] = [.beginner, .cardio]
    
    static let plan1 = Plan(id: "1", name: "Intermediate Full Body", days: days1, tags: tags1)
    static let plan2 = Plan(id: "2", name: "Some other plan", days: days2, tags: tags2)
    static var previews: some View {
        ScrollView {
            VStack {
                Divider()
                PlanRowView(plan: plan1)
                Divider()
                PlanRowView(plan: plan2)
                Divider()
                PlanRowView(plan: plan1)
                Divider()
                PlanRowView(plan: plan2)
                Divider()
            }
        }
    }
}
