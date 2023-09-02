//
//  SX_Crew.swift
//  SpaceX
//
//  Created by Omar on 30.08.23.
//

import Foundation

struct SX_Crew: Codable, Identifiable {

    let id: String
    let name: String
    let agency: String
    let image: URL
    let wikipedia: URL
    let launches: [String]
    let status: String
   }
