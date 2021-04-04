//
//  Shipping.swift
//  ProductSearchApp
//
//  Created by Elliot on 30-03-21.
//

import Foundation

struct Shipping: Codable {
    var freeShipping: Bool
    
    private enum CodingKeys: String, CodingKey, Codable {
        case freeShipping = "free_shipping"
    }
}
