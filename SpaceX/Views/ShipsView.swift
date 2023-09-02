//
//  ShipsView.swift
//  SpaceX
//
//  Created by Omar on 02.09.23.
//

import SwiftUI

struct ShipsView: View {
    @StateObject var viewModel = ShipsViewModel()

    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
            }
            .navigationTitle("SP-X Ships")
        }
    }
}

struct ShipsView_Previews: PreviewProvider {
    static var previews: some View {
        ShipsView()
    }
}
