//
//  RegularModal.swift
//  GymPartner
//
//  Created by Klaudiusz Mękarski on 22/11/2023.
//

import SwiftUI

struct ModalWithTextField: View {
    var title: String
    var placeholder: String
    @Binding var text: String
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
                    AccentUnderlineTextField(title: placeholder, text: $text)
                        .padding(.bottom)
                    HStack(spacing: 30) {
                        Button("Cancel") {
                           hideModal()
                        }
                        Button("OK") {
                            onAccept()
                            hideModal()
                        }
                        .disabled(text == "")
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

struct ModalWithTextField_Previews: PreviewProvider {
    static var previews: some View {
        ModalWithTextField(title: "New plan", placeholder: "Plan name", text: .constant(""), isShowing: .constant(true)) {
            print("OK")
        }
    }
}
