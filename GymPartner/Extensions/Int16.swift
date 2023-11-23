//
//  Int16.swift
//  GymPartner
//
//  Created by Klaudiusz Mękarski on 23/11/2023.
//

import Foundation

extension Int16 {
    var timeFormat: String {
        switch(self) {
        case 0...59:
            return "\(self)s"
        case 60...3599:
            return "\(self/60)m"
        default:
            return "\(self/3600)h \((self%3600)/60)m"
        }
    }
}
