//
//  AccentUnderlineTextField.swift
//  GymPartner
//
//  Created by Klaudiusz Mękarski on 22/11/2023.
//

import SwiftUI

struct AccentUnderlineTextField: View {
    var title: String
    @Binding var text: String
    var body: some View {
        VStack(spacing: 2) {
            TextField("", text: $text, prompt: Text(title).foregroundColor(.theme.secondaryText))
                .frame(height: 32)
                .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 16))
            .foregroundColor(.theme.primaryText)
            Capsule()
                .frame(width: .infinity, height: 1)
                .foregroundColor(.theme.accent)
        }
    }
}

struct AccentUnderlineTextField_Previews: PreviewProvider {
    static var previews: some View {
        AccentUnderlineTextField(title: "Plan name", text: .constant(""))
            .padding(64)
    }
}
