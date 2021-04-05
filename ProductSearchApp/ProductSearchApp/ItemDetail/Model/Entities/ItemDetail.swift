//
//  ItemDetail.swift
//  ProductSearchApp
//
//  Created by Elliot on 01-04-21.
//

struct ItemDetail: Codable {
    var id: String
    var sellerId: Int
    var title: String
    var price: Int
    var thumbnail: String
    var condition: String
    var warranty: String?
    var availableQuantity: Int
    var soldQuantity: Int
    var pictures: [Picture]
    
    private enum CodingKeys: String, CodingKey, Codable {
        case id
        case sellerId = "seller_id"
        case title
        case price
        case thumbnail
        case condition
        case warranty
        case availableQuantity = "available_quantity"
        case soldQuantity = "sold_quantity"
        case pictures
    }
}
