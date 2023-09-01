//
//  SX_Service.swift
//  SpaceX
//
//  Created by Omar on 30.08.23.
//

import Foundation

final class SX_Service {
    static let shared = SX_Service()
    
    init() {}
    
    enum SXServiceError : Error {
        case failedToCreateRequest
        case failToGetData
        case faildToReadResponse
    }
    
    public func execute<T: Codable>(
        _ request: SX_Request,expecting type: T.Type,completion: @escaping (Result<T, Error>) -> Void) {
            guard let urlRequest = self.request(from: request) else {
                completion(.failure(SXServiceError.failedToCreateRequest))
                return
            }
            
            let task = URLSession.shared.dataTask(with: urlRequest){ data, response, error in
                guard let data = data, error == nil else {
                    completion(.failure(error ?? SXServiceError.failToGetData))
                    return
                }
                
                do {
                    let json = try JSONSerialization.jsonObject(with: data)
                    print(String(describing: json))
                }
                catch {
                    completion(.failure(error))
                }
            }
            task.resume()
        }
    
    private func request(from sxRequest:SX_Request) -> URLRequest? {
        guard let url = sxRequest.url else {return nil}
        var request = URLRequest(url: url)
        request.httpMethod = sxRequest.httpMethod
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = sxRequest.httpBody.data(using: .utf8)
        return request
    }
    
    
}
