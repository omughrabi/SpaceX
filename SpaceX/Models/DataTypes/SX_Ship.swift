//
//  SX_Ships.swift
//  SpaceX
//
//  Created by Omar on 30.08.23.
//

import Foundation

struct SX_Ship: Codable, Identifiable {

    let id: String
    let legacy_id: String?
    let model: String?
    let type: String
    let imo: Int?
    let mmsi: Int?
    let `class`: Int?
    let mass_kg: Double?
    let year_built: Int?
    let home_port: String
    let link: URL?
    let image: URL?
    let name: String
    let active: Bool
    let launches: [String]
}
