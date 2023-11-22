//
//  HomeView.swift
//  GymPartner
//
//  Created by Klaudiusz Mękarski on 20/11/2023.
//

import SwiftUI

struct HomeView: View {
    @Binding var showAuthView: Bool
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
            SettingsView(showAuthView: $showAuthView)
                .tabItem {
                    Image(systemName: "gearshape")
                    Text("Settings")
                }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(showAuthView: .constant(false))
            .environmentObject(dev.homeViewModel)
            .environmentObject(dev.settingsViewModel)
    }
}
