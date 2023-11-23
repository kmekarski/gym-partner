//
//  RegularTextField.swift
//  GymPartner
//
//  Created by Klaudiusz Mękarski on 23/11/2023.
//

import SwiftUI

struct RegularTextField: View {
    
    var title: String
    @Binding var text: String
    var onClear: () -> () = {}
    var invalid: Bool = false
    
    var body: some View {
        ZStack(alignment: .trailing) {
            VStack(spacing: 2) {
                TextField("", text: $text, prompt: Text(title).foregroundColor(.theme.secondaryText))
                    .frame(height: 40)
                    .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 16))
                    .foregroundColor(.theme.primaryText)
                bottomBorder
            }
            if !text.isEmpty {
                clearButton
            }
        }
    }
}

struct RegularTextField_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            RegularTextField(title: "Plan name", text: .constant(""))
            RegularTextField(title: "Plan name", text: .constant(""))
            RegularTextField(title: "Plan name", text: .constant(""))
        }
        .padding()
    }
}

extension RegularTextField {
    private var bottomBorder: some View {
        Capsule()
            .frame(width: .infinity, height: 1)
            .foregroundColor(invalid ? .red : Color(.systemGray4))
    }
    
    private var clearButton: some View {
        Image(systemName: "xmark.circle.fill")
            .foregroundColor(invalid ? .red : .theme.secondaryText)
            .padding(.trailing, 16)
            .onTapGesture {
                text = ""
                onClear()
            }
    }
}
