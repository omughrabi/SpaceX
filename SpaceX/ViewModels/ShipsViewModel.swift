//
//  ShipViewModel.swift
//  SpaceX
//
//  Created by Omar on 02.09.23.
//

import Foundation

class ShipsViewModel: ObservableObject {
    
    func getShips() {
        SX_Service.shared.execute(.listRocketsRequest, expecting: SX_Ship.self) { result in
            switch result {
            case .success(let model):
                print(model)
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
}
