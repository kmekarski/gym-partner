//
//  WideAccentButton.swift
//  GymPartner
//
//  Created by Klaudiusz Mękarski on 21/11/2023.
//

import SwiftUI

struct WideAccentButton: View {
    var text: String
    
    init(_ text: String) {
        self.text = text
    }
    var body: some View {
        Text(text)
            .font(.system(size: 18, weight: .bold))
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 14)
            .background(Color.theme.accent)
            .cornerRadius(20)
    }
}

struct WideAccentButton_Previews: PreviewProvider {
    static var previews: some View {
        WideAccentButton("Login")
    }
}
