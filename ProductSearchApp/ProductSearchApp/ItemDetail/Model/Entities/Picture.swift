//
//  Picture.swift
//  ProductSearchApp
//
//  Created by Elliot on 01-04-21.
//

struct Picture: Codable {
    var url: String?
    var secureUrl: String?
    
    private enum CodingKeys: String, CodingKey, Codable {
        case url
        case secureUrl = "secure_url"
    }
}
