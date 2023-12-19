//
//  ThickerDivider.swift
//  GymPartner
//
//  Created by Klaudiusz Mękarski on 19/12/2023.
//

import SwiftUI

struct ThickerDivider: View {
    var body: some View {
        Divider()
            .frame(minHeight: 1)
            .overlay(Color.theme.secondaryText)
    }
}

struct ThickerDivider_Previews: PreviewProvider {
    static var previews: some View {
        ThickerDivider()
    }
}
