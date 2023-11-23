//
//  Color.swift
//  GymPartner
//
//  Created by Klaudiusz Mękarski on 21/11/2023.
//

import Foundation
import SwiftUI

extension Color {
    static let theme = ColorTheme()
}

struct ColorTheme {
    let accent = Color.blue
    let primaryText = Color("PrimaryTextColor")
    let secondaryText = Color.secondary
    let secondaryBackground = Color("SecondaryBackgroundColor")
    let border = Color("BorderColor")
}
