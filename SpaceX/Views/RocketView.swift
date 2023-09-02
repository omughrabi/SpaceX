//
//  RocketView.swift
//  SpaceX
//
//  Created by Omar on 29.08.23.
//

import SwiftUI

struct RocketView: View {
    @StateObject var viewModel = RocketViewModel()

    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
            }
            .navigationTitle("SP-X Rockets")
        }
    }
}
struct RocketView_Previews: PreviewProvider {
    static var previews: some View {
        RocketView()
    }
}
