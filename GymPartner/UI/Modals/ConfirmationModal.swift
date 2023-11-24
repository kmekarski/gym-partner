//
//  ConfirmationModal.swift
//  GymPartner
//
//  Created by Klaudiusz Mękarski on 24/11/2023.
//

import SwiftUI

struct ConfirmationModal: View {
    var title: String
    var message: String
    @Binding var isShowing: Bool
    var onAccept: () -> () = {}
    
    private func hideModal() {
        isShowing = false
    }

    var body: some View {
        ZStack {
            if isShowing {
                Color.black.opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                        hideModal()
                    }
                VStack {
                    Text(title)
                        .font(.system(size: 22, weight: .semibold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 8)
                    Text(message)
                        .font(.system(size: 16, weight: .regular))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .lineSpacing(3)
                        .padding(.bottom)
                    HStack(spacing: 30) {
                        Button("Cancel") {
                           hideModal()
                        }
                        Button("OK") {
                            onAccept()
                            hideModal()
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                }
                .padding(24)
                .frame(maxWidth: .infinity)
                .background(Material.thick)
                .cornerRadius(24)
                .padding()
            }
        }
        .frame(maxWidth: .infinity)
        .frame(maxHeight: .infinity)
    }
}

struct ConfirmationModal_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmationModal(title: "Cancel workout", message: "Are you sure you want to cancel your workout?", isShowing: .constant(true))
    }
}
