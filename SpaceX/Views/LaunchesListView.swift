//
//  LaunchesListView.swift
//  SpaceX
//
//  Created by Omar on 29.08.23.
//

import SwiftUI

struct LaunchesListView: View {
    @StateObject var viewModel = LaunchesListViewModel()
    

    var body: some View {
        NavigationView {
            VStack {
                Text("Launches for the last 3 years & Upcoming for the next 3 year:")
                    .font(.title3)
                    .padding(.horizontal)
                Spacer()
                
            }
            .navigationTitle("SP-X Missions")
            .toolbar {
                Button("Filter"){
                    // Add filter actions later
                }
            }
        }
    }
}

struct LaunchesListView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchesListView()
    }
}
