//
//  SX_GetRocketsDataSet.swift
//  SpaceX
//
//  Created by Omar on 02.09.23.
//

import Foundation

struct SX_GetRocketsDataSet: Codable {
        let docs: [SX_Rocket]
        let totalDocs: Int
        let offset: Int
        let limit: Int
        let totalPages: Int
        let page: Int
        let pagingCounter: Int
        let hasPrevPage: Bool
        let hasNextPage: Bool
        let prevPage: Int?
        let nextPage: Int?
}
