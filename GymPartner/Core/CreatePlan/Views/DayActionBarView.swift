//
//  DayActionBarView.swift
//  GymPartner
//
//  Created by Klaudiusz Mękarski on 23/11/2023.
//

import SwiftUI

struct DayActionBarView: View {
    @State var expanded: Bool = false
    var body: some View {
        ZStack(alignment: .bottom) {
            if expanded {
                background
            }
            VStack(spacing: 2) {
                Spacer()
                if expanded {
                    menu
                }
                actionBar
            }
            .padding(.bottom)
        }
        .frame(maxWidth: .infinity)
    }
}

struct DayActionBarView_Previews: PreviewProvider {
    static var previews: some View {
        DayActionBarView()
    }
}

extension DayActionBarView {
    private var background: some View {
        Color.black.opacity(0.3).ignoresSafeArea()
            .onTapGesture {
                withAnimation(.linear(duration: 0.3)) {
                    expanded = false
                }
            }
    }
    
    private var actionBar: some View {
        HStack {
            Button {
                
            } label: {
                Image(systemName: "plus")
                    .padding(.horizontal, 20)
            }
            Rectangle()
                .frame(width: 1, height: 20)
                .foregroundColor(Color(.systemGray2))
            Button {
                withAnimation(.linear(duration: 0.3)) {
                    expanded.toggle()
                }
            } label: {
                Image(systemName: "ellipsis")
                    .padding(.horizontal, 20)
            }
        }
        .padding()
        .frame(width: 170)
        .background(Color(.systemGray5))
        .cornerRadius(20, corners: expanded ? [.bottomLeft, .bottomRight] : .allCorners)
    }
    
    private var menu: some View {
        VStack {
            HStack {
                Image(systemName: "pencil")
                    .frame(width: 30, alignment: .leading)
                Text("Rename day")
                    .frame(width: 100, alignment: .leading)
            }
            .padding(8)
            Divider()
            HStack {
                Image(systemName: "trash")
                    .frame(width: 30, alignment: .leading)
                Text("Delete day")
                    .frame(width: 100, alignment: .leading)
            }
            .padding(8)
        }
        .font(.system(size: 16, weight: .semibold))
        .padding()
        .frame(width: 170)
        .background(Color(.systemGray5))
        .cornerRadius(20, corners: [.topLeft, .topRight])
    }
}
