//
//  RocketViewModel.swift
//  SpaceX
//
//  Created by Omar on 29.08.23.
//

import Foundation

class RocketViewModel: ObservableObject {
    
    func getRocket() {
        SX_Service.shared.execute(.listRocketsRequest, expecting: SX_GetRocketsDataSet.self) { result in
            switch result {
            case .success(let model):
                print(model.docs[3].flickr_images)
                print(model.docs[3].flickr_images)
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
}
