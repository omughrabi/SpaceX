//
//  RocketViewModel.swift
//  SpaceX
//
//  Created by Omar on 29.08.23.
//

import Foundation

class RocketViewModel: ObservableObject {
    
    func getRocket() {
        SX_Service.shared.execute(.listRocketsRequest, expecting: String.self) { result in
            switch result {
            case .success(let model):
                print(String(describing: model))
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
}
