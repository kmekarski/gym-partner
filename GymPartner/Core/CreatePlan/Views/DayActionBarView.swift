//
//  DayActionBarView.swift
//  GymPartner
//
//  Created by Klaudiusz Mękarski on 23/11/2023.
//

import SwiftUI

struct DayActionBarView: View {
    @EnvironmentObject var homeVM: HomeViewModel
    @State var expanded: Bool = false
    @State var newDayName: String = ""
    @State var showRenameDayModal: Bool = false
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
            ModalWithTextField(title: "Rename day", placeholder: "New name", text: $newDayName, isShowing: $showRenameDayModal) {
                homeVM.renameDay(day: homeVM.selectedDay, newName: newDayName)
            }
        }
        .frame(maxWidth: .infinity)
    }
}

struct DayActionBarView_Previews: PreviewProvider {
    static var previews: some View {
        DayActionBarView()
            .environmentObject(dev.homeViewModel)
    }
}

extension DayActionBarView {
    private var background: some View {
        Color.black.opacity(0.2).ignoresSafeArea()
            .onTapGesture {
                hide()
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
                toggle()
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
            Button {
                showRenameDayModal = true
                hide()
            } label: {
                HStack {
                    Image(systemName: "pencil")
                        .frame(width: 30, alignment: .leading)
                    Text("Rename day")
                        .frame(width: 100, alignment: .leading)
                }
                .padding(8)
            }
            Divider()
            Button {
                homeVM.deleteDay(day: homeVM.selectedDay)
                hide()
            } label: {
                HStack {
                    Image(systemName: "trash")
                        .frame(width: 30, alignment: .leading)
                    Text("Delete day")
                        .frame(width: 100, alignment: .leading)
                }
                .padding(8)
            }
        }
        .font(.system(size: 16, weight: .semibold))
        .padding()
        .frame(width: 170)
        .background(Color(.systemGray5))
        .cornerRadius(20, corners: [.topLeft, .topRight])
    }
    
    private func hide() {
        withAnimation(.linear(duration: 0.3)) {
            expanded = false
        }
    }
    
    private func toggle() {
        withAnimation(.linear(duration: 0.3)) {
            expanded.toggle()
        }
    }
}
