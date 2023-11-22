//
//  HomeView.swift
//  GymPartner
//
//  Created by Klaudiusz Mękarski on 20/11/2023.
//

import SwiftUI

struct HomeView: View {
    @Binding var authViewType: AuthViewType
    var body: some View {
        TabView {
            MyPlansView()
            .tabItem {
                Image(systemName: "dumbbell")
                Text("My plans")
            }
            SharedPlansView()
                .tabItem {
                    Image(systemName: "person.2")
                    Text("Shared plans")
                }
            HistoryView()
                .tabItem {
                    Image(systemName: "chart.bar.doc.horizontal")
                    Text("Workout history")
                }
            SettingsView(authViewType: $authViewType)
                .tabItem {
                    Image(systemName: "gearshape")
                    Text("Settings")
                }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(authViewType: .constant(.none))
            .environmentObject(dev.homeViewModel)
            .environmentObject(dev.settingsViewModel)
    }
}
