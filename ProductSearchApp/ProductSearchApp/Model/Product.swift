//
//  Product.swift
//  ProductSearchApp
//
//  Created by Elliot on 29-03-21.
//

import Foundation

struct Product: Codable {
    var id: String
    var title: String
    var price: Int
    var thumbnail: String
    var installments: Installments
    var shipping: Shipping
}
