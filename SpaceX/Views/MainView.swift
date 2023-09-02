//
//  ContentView.swift
//  SpaceX
//
//  Created by Omar on 29.08.23.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewModel()

    var body: some View {
        TabView {
            LaunchesListView()
                .tabItem {
                    Label("Launches", systemImage: "star.leadinghalf.filled")
                }
            RocketView()
                .tabItem {
                    Label("Rockets", systemImage: "paperplane.fill")
                }
            ShipsView()
                .tabItem {
                    Label("Ships", systemImage: "airplane")
                }
            CrewView()
                .tabItem {
                    Label("Crew", systemImage: "person.3.fill")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
