//
//  DetailProduct.swift
//  ProductSearchApp
//
//  Created by Elliot on 01-04-21.
//

struct DetailProduct: Codable {
    var id: String
    var title: String
    var price: Int
    var thumbnail: String
    var condition: String
    var pictures: [Picture]
    
}
