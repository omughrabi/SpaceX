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
        VStack {
            Text("Hello World")
        }
        .onAppear {
            viewModel.helloWorldPrint()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
