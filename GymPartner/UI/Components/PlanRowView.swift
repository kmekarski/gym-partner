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
                    .font(.system(size: 20, weight: .regular))
                    .frame(width: 230, alignment: .leading)
                Spacer()
                HStack {
                    Image(systemName: "calendar")
                    Text("\(plan.days.count)")
                }
                .font(.system(size: 22, weight: .light))
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
        .background(Color(.systemGray5))
        .cornerRadius(16)
    }
}

struct PlanRowView_Previews: PreviewProvider {
    
    static var previews: some View {
        ScrollView {
            VStack {
                Divider()
                PlanRowView(plan: dev.plans[0])
                Divider()
                PlanRowView(plan: dev.plans[1])
                Divider()
                PlanRowView(plan: dev.plans[0])
                Divider()
                PlanRowView(plan: dev.plans[1])
                Divider()
            }
            .padding()
        }
    }
}
