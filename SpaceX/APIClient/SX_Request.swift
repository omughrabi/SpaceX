//
//  SX_Request.swift
//  SpaceX
//
//  Created by Omar on 30.08.23.
//

import Foundation

final class SX_Request {
    
    private struct Constants {
        static let baseURL = "https://api.spacexdata.com"
        static let version = "v4"
    }
    
    private let endpoint: SX_EndPoint
    
    private let pathComponents: [String]
    
    private let queryParameters: [URLQueryItem]
    
    public let httpMethod: String
    public let httpBody: String
    
    
    
    private var urlString: String {
        var string = Constants.baseURL
        string += "/"
        string += Constants.version
        string += "/"
        string += endpoint.rawValue
        
        if !pathComponents.isEmpty{
            pathComponents.forEach ({
                string += "/\($0)"
            })
        }
        
        if !queryParameters.isEmpty{
            string += "?"
            let argumentString = queryParameters.compactMap({
                guard let value = $0.value else {return nil}
                return "\($0.name)=\(value)"
            }).joined(separator: "&")
            string += argumentString
        }
        
        return string
    }
    
    public var url: URL? {
        return URL(string: urlString)
    }
    
    
    public init(httpMethod: String,
                endpoint: SX_EndPoint,
                pathComponents: [String] = [],
                queryParameters: [URLQueryItem] = [],
                httpBody: String = ""
                
    
    
    ) {
        self.httpMethod = httpMethod
        self.endpoint = endpoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
        self.httpBody = httpBody
        
    }
    
}
    
    
