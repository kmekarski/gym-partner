//
//  RoundedSquareButton.swift
//  GymPartner
//
//  Created by Klaudiusz Mękarski on 23/11/2023.
//

import SwiftUI

struct RoundedSquareButton: View {
    var systemName: String
    var border: Bool = false
    var rotated: Bool = false
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Rectangle()
                    .foregroundColor(.theme.secondaryBackground)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .cornerRadius(geometry.size.width/4)
                    .shadow(color: border ? .theme.border : .black.opacity(0.15), radius: border ? 1 : 3, x: 0, y: border ? 0 : 2)
                Image(systemName: systemName)
                    .rotationEffect(Angle(degrees: rotated ? 180 : 0))
                    .foregroundColor(.theme.primaryText)
                    .font(.system(size: geometry.size.width * 0.4))
            }
        }
    }
}

struct RoundedSquareButton_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            RoundedSquareButton(systemName: "arrow.left")
                .frame(width: 50, height: 50)
            RoundedSquareButton(systemName: "arrow.left", rotated: true)
                .frame(width: 70, height: 70)
            RoundedSquareButton(systemName: "arrow.left", border: true)
                .frame(width: 50, height: 50)
            RoundedSquareButton(systemName: "arrow.left", border: true, rotated: true)
                .frame(width: 70, height: 70)
        }
    }
}
