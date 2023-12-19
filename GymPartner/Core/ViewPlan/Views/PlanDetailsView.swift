//
//  PlanDetailsView.swift
//  GymPartner
//
//  Created by Klaudiusz Mękarski on 19/12/2023.
//

import SwiftUI

struct PlanDetailsView: View {
    @EnvironmentObject var homeVM: HomeViewModel
    @EnvironmentObject var viewPlanVM: ViewPlanViewModel
    var body: some View {
        VStack {
            header
//            if let plan = viewPlanVM.currentPlan {}
            Spacer()
        }
        .padding()
    }
}

struct PlanDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PlanDetailsView()
            .environmentObject(dev.homeViewModel)
            .environmentObject(dev.viewPlanViewModel)
    }
}

extension PlanDetailsView {
    private var header: some View {
        HStack {
            Button {
                viewPlanVM.selectPlan(nil)
                homeVM.myPlansState = .browse
            } label: {
                RoundedSquareButton(systemName: "xmark", border: true)
                    .frame(width: 50, height: 50)
            }
            Spacer()
                Text("Plan details")
                    .font(.system(size: 32, weight: .semibold))
        
            Spacer()
            RoundedSquareButton(systemName: "xmark")
                .frame(width: 50, height: 50).opacity(0)
        }
    }
}
