//
//  Paging.swift
//  ProductSearchApp
//
//  Created by Elliot on 30-03-21.
//

import Foundation

struct Paging: Codable {
    var total: Int
    var primaryResults: Int
    var offset: Int
    var limit: Int
    
    private enum CodingKeys: String, CodingKey, Codable {
        case total
        case primaryResults = "primary_results"
        case offset
        case limit
    }
}
