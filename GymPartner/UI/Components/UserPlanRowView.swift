//
//  UserPlanRowView.swift
//  GymPartner
//
//  Created by Klaudiusz Mękarski on 23/11/2023.
//

import SwiftUI

struct UserPlanRowView: View {
    var plan: Plan
    var body: some View {
        VStack(spacing: 20) {
            if let authorName = plan.authorName,
               let authorPhotoURl = plan.authorPhotoUrl {
                VStack {
                    HStack(spacing: 10) {
                        AsyncImage(
                            url: URL(string: authorPhotoURl),
                            content: { image in
                                image.resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(Circle())
                                    .frame(maxWidth: 40, maxHeight: 40)
                            },
                            placeholder: {
                                ProgressView()
                            }
                        )
                        Text(authorName)
                            .font(.system(size: 16, weight: .semibold))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    Divider()
                }
            }
            
            
            
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
        .background(Color(.systemGray5))
        .cornerRadius(16)
    }
}

struct UserPlanRowView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            VStack {
                Divider()
                UserPlanRowView(plan: dev.plans[0])
                Divider()
                UserPlanRowView(plan: dev.plans[1])
                Divider()
                UserPlanRowView(plan: dev.plans[0])
                Divider()
                UserPlanRowView(plan: dev.plans[1])
                Divider()
            }
            .padding()
        }
    }
}
