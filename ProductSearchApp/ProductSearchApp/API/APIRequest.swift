//
//  APIRequest.swift
//  ProductSearchApp
//
//  Created by Elliot on 30-03-21.
//

import Foundation

public enum Type: String {
    case GET, POST, PUT, DELETE
}

protocol APIRequest {
    var method: Type { get }
    var path: String { get }
    var parameters: [String : String]? { get }
    var headers: [String: String]? { get }
}

extension APIRequest {
    
    func request(with baseURL: URL) -> URLRequest {
        guard var components = URLComponents(url: baseURL.appendingPathComponent(path),
                                             resolvingAgainstBaseURL: false) else {
                                                fatalError("error to create component")
        }
        
        if let params = parameters {
            components.queryItems = params.map {
                URLQueryItem(name: String($0), value: String($1))
            }
        }

        guard let url = components.url else {
            fatalError("url error")
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        if let userHeader = headers {
            _ = userHeader.map {
                request.addValue($1, forHTTPHeaderField: $0)
            }
        }

        return request
    }
}

