//
//  ProductResult.swift
//  ProductSearchApp
//
//  Created by Elliot on 30-03-21.
//

import Foundation

struct ProductResult: Codable {
    var query: String
    var paging: Paging
    var results: [Product]
}
