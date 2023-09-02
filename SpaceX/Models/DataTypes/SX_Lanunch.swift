//
//  Lanunche.swift
//  SpaceX
//
//  Created by Omar on 29.08.23.
//

import Foundation

struct SX_Launch: Codable, Identifiable {
    
    let id: String
    let date: TimeInterval
    let upcoming: Bool
    let rocket: SX_Rocket
    let success: Bool
    let failures: [String]
    let details: String
    let crew: [SX_Crew]
    let ships: [SX_Ship]
    let launchpad: String
    let flight_number: String
    let name: String
    let date_unix: TimeInterval
}
