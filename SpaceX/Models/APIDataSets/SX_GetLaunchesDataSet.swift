//
//  SX_GetLaunchesDataSet.swift
//  SpaceX
//
//  Created by Omar on 02.09.23.
//

import Foundation

struct SX_GetLaunchesDataSet: Codable {
        let docs: [SX_Launch]
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
