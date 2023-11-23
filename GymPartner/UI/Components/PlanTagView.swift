//
//  PlanTagView.swift
//  GymPartner
//
//  Created by Klaudiusz Mękarski on 23/11/2023.
//

import SwiftUI

struct PlanTagView: View {
    var tag: PlanTag

    var body: some View {

        HStack {
            Image(systemName: iconNameForTag(planTag: tag))
            Text(tag.rawValue)
        }
        .font(.system(size: 14, weight: .semibold))
        .padding(.horizontal, 12)
        .padding(.vertical, 8)
        .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color(.systemGray2), lineWidth: 3)
                )
    }
}

struct PlanTagView_Previews: PreviewProvider {
    static var previews: some View {
        PlanTagView(tag: .beginner)
    }
}

extension PlanTagView {
    func iconNameForTag(planTag: PlanTag) -> String{
        switch planTag {
        case .beginner:
            return "figure.walk"
        case .intermediate:
            return "figure.run"
        case .expert:
            return "figure.gymnastics"
        case .strength:
            return "dumbbell"
        case .flexibility:
            return "figure.flexibility"
        case .cardio:
            return "heart"
        case .yoga:
            return "figure.mind.and.body"
        }
    }
}
