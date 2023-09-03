//
//  LaunchCollectionViewCellViewModel.swift
//  SpaceX
//
//  Created by Omar on 02.09.23.
//

import Foundation

final class LaunchCollectionViewCellViewModel {
    public let flightNumber: String
    public let launchName: String
    public let launchDate: String
    public let launchDetails: String
    public let upComing: Bool
    private let launchImageURL: URL?
    
    init(
        flightNumber: String,
        launchName: String,
        launchDate: String,
        launchDetails: String,
        upComing: Bool,
        launchImageURL: URL?
    ){
        self.flightNumber = flightNumber
        self.launchName = launchName
        self.launchDetails = launchDetails
        self.launchDate = launchDate
        self.upComing = upComing
        self.launchImageURL = launchImageURL
    }
    
    public func fetchImage(completion: @escaping (Result<Data, Error>) -> Void) {
        guard let url = launchImageURL else {
            completion(.failure(URLError(.badURL)))
            return
        }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? URLError(.badServerResponse)))
                return }
            
        completion(.success(data))
        }
        task.resume()
       
    }
}
