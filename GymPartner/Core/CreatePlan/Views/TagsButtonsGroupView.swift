//
//  TagsButtonsGroupView.swift
//  GymPartner
//
//  Created by Klaudiusz Mękarski on 23/11/2023.
//

import SwiftUI

struct TagsButtonsGroupView: View {
    let geometry: GeometryProxy
    @Binding var selectedTags: [String]
    
    var body: some View {
        self.generateContent(in: geometry)
    }
    
    private func generateContent(in g: GeometryProxy) -> some View {
        var width = CGFloat.zero
        var height = CGFloat.zero + 30
        
        return ZStack(alignment: .topLeading) {
            ForEach(PlanTag.allCases, id: \.self) { tag in
                self.item(for: tag)
                    .padding(.horizontal, 4)
                    .padding(.vertical, 8)
                    .alignmentGuide(.leading, computeValue: { d in
                        if (abs(width - d.width) > g.size.width - 36)
                        {
                            width = 0
                            height -= d.height
                        }
                        let result = width
                        if tag == PlanTag.allCases.first! {
                            width = 0 //last item
                        } else {
                            width -= d.width
                        }
                        return result
                    })
                    .alignmentGuide(.top, computeValue: {d in
                        let result = height
                        if tag == PlanTag.allCases.first! {
                            height = 0 // last item
                        }
                        return result
                    })
                    .onTapGesture {
                        if selectedTags.contains(tag.rawValue) {
                            withAnimation() {
                                selectedTags.removeAll { selectedTag in
                                    selectedTag == tag.rawValue
                                }
                            }
                        } else {
                            withAnimation() {
                                selectedTags.append(tag.rawValue)
                            }
                        }
                    }
            }
        }
    }
    
    func item(for tag: PlanTag) -> some View {
        PlanTagView(tag: tag, isSelected: selectedTags.contains(tag.rawValue))
    }
}
