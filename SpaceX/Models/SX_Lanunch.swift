//
//  Lanunche.swift
//  SpaceX
//
//  Created by Omar on 29.08.23.
//

import Foundation

struct SX_Launch: Codable, Identifiable {
    
    let id: String
    let flightNumber: String
    let details: String?
    let date: TimeInterval
    let upcoming: Bool
    
}
