//
//  NumberStepper.swift
//  GymPartner
//
//  Created by Klaudiusz Mękarski on 24/11/2023.
//

import SwiftUI

struct NumberStepper: View {
    var value: Int
    var min: Int = 0
    var max: Int = 99
    var seconds: Bool = false
    var onMinus: () -> ()
    var onPlus: () -> ()
    var body: some View {
            HStack {
                minusButton
                divider
                plusButton
            }
            .background(Color(.systemGray6))
            .cornerRadius(10, corners: .allCorners)        
    }
}

struct NumberStepper_Previews: PreviewProvider {
    static var previews: some View {
        NumberStepper(value: 3) {
            
        } onPlus: {
            
        }

    }
}

extension NumberStepper {
    private var minusButton: some View {
        Button {
            if value > min {
                onMinus()
            }
        } label: {
            Image(systemName: "minus")
                .font(.system(size: 12, weight: .regular))
                .padding(.vertical, 10)
                .padding(.leading, 10)
        }
    }
    
    private var plusButton: some View {
        Button {
            if value < max {
                onPlus()
            }
        } label: {
            Image(systemName: "plus")
                .font(.system(size: 12, weight: .regular))
                .padding(.vertical, 10)
                .padding(.trailing, 10)
        }
    }
    
    private var divider: some View {
        Rectangle()
            .frame(width: 1, height: 16)
            .foregroundColor(.theme.secondaryText)
    }
}
