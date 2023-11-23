//
//  Date.swift
//  GymPartner
//
//  Created by Klaudiusz Mękarski on 23/11/2023.
//

import Foundation

extension Date {
    var full: String {
        return self.formatted(date: .long, time: .shortened)
    }
}
