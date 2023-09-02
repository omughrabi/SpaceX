//
//  SX_GetShipsDataSet.swift
//  SpaceX
//
//  Created by Omar on 02.09.23.
//

import Foundation


struct SX_GetShipsDataSet: Codable {

    let ships: [SX_Ship]

    enum CodingKeys: String, CodingKey {
        case ships = "" // This is an empty string because there's no key in the JSON
    }

    init(from decoder: Decoder) throws {
        // Decode the array of SX_Ships objects directly from the JSON array
        var container = try decoder.unkeyedContainer()
        var shipsA = [SX_Ship]()

        while !container.isAtEnd {
            let ships = try container.decode(SX_Ship.self)
            shipsA.append(ships)
        }

        self.ships = shipsA
    }
}
