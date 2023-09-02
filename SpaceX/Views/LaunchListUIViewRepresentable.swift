//
//  LaunchListUIViewRepresentable.swift
//  SpaceX
//
//  Created by Omar on 02.09.23.
//

import SwiftUI

struct LaunchListViewRepresentable: UIViewRepresentable {
    func makeUIView(context: Context) -> LaunchListView {
        return LaunchListView()
    }

    func updateUIView(_ uiView: LaunchListView, context: Context) {
        NSLayoutConstraint.activate([
            uiView.topAnchor.constraint(equalTo: uiView.superview!.safeAreaLayoutGuide.topAnchor),
            uiView.leftAnchor.constraint(equalTo: uiView.superview!.safeAreaLayoutGuide.leftAnchor),
            uiView.rightAnchor.constraint(equalTo: uiView.superview!.safeAreaLayoutGuide.rightAnchor),
            uiView.bottomAnchor.constraint(equalTo: uiView.superview!.safeAreaLayoutGuide.bottomAnchor),
        
        ])
    }
}
