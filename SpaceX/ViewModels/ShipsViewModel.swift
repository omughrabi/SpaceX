//
//  ShipViewModel.swift
//  SpaceX
//
//  Created by Omar on 02.09.23.
//

import Foundation

class ShipsViewModel: ObservableObject {
    
    func getShips() {
        SX_Service.shared.execute(.listShipsRequest, expecting: SX_GetShipsDataSet.self) { result in
            switch result {
            case .success(let model):
                print(model.ships[0].name)
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
}
