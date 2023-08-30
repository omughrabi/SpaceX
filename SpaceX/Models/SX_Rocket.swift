//
//  Rocket.swift
//  SpaceX
//
//  Created by Omar on 29.08.23.
//

import Foundation

struct SX_Rocket: Codable, Identifiable {
    
    let id: String
    let rocketNumber: String
    let name: String
    let type: String
    let active: Bool
    let stages: String
    let boosters: String
    let cost_per_launch: Double
    let success_rate_pct: Int
    let first_flight: String
    let country: String
    let company: String
    let wikipedia: URL
    let description: String

    
}


   
