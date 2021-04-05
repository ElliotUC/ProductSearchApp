//
//  Item.swift
//  ProductSearchApp
//
//  Created by Elliot on 29-03-21.
//

import Foundation

struct Item: Codable {
    var id: String
    var title: String
    var price: Int
    var thumbnail: String
    var installments: Installments
    var shipping: Shipping
    var originalPrice: Int?
    
    private enum CodingKeys: String, CodingKey, Codable {
        case id
        case title
        case price
        case thumbnail
        case installments
        case shipping
        case originalPrice = "original_price"
    }
}
