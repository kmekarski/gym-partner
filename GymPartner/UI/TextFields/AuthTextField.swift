//
//  AuthTextField.swift
//  GymPartner
//
//  Created by Klaudiusz Mękarski on 22/11/2023.
//

import SwiftUI

struct AuthTextField: View {
    
    var title: String
    @Binding var text: String
    var iconName: String
    var secure: Bool = false
    var onClear: () -> () = {}
    var invalid: Bool = false
    
    var body: some View {
        ZStack(alignment: .trailing) {
            VStack {
                HStack {
                    icon
                    if secure {
                        secureTextField
                    } else {
                        regularTextField
                    }
                }
                bottomBorder
            }
            if !text.isEmpty {
                clearButton
            }
        }
    }
}

struct AuthTextField_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 30) {
            AuthTextField(title: "Email", text: .constant(""), iconName: "at", onClear: {
                
            }, invalid: false)
            AuthTextField(title: "Email", text: .constant("user@gmail.com"), iconName: "at", onClear: {
                
            }, invalid: false)
            AuthTextField(title: "Password", text: .constant(""), iconName: "lock", secure: true, onClear: {
                
            }, invalid: false)
            AuthTextField(title: "Password", text: .constant("lalala"), iconName: "lock", secure: true, onClear: {
                
            }, invalid: true)
        }
        .padding(32)
    }
}

extension AuthTextField {
    private var icon: some View {
        Image(systemName: iconName)
            .font(.title2)
            .foregroundColor(invalid ? .red : .theme.secondaryText)
            .frame(width: 40)
    }
    
    private var secureTextField: some View {
        SecureField("", text: $text, prompt: Text(title).foregroundColor(.theme.secondaryText))
            .frame(height: 40)
            .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 16))
            .foregroundColor(.theme.primaryText)
    }
    
    private var regularTextField: some View {
        TextField("", text: $text, prompt: Text(title).foregroundColor(.theme.secondaryText))
            .frame(height: 40)
            .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 16))
            .foregroundColor(.theme.primaryText)
    }
    
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
