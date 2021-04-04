//
//  ItemDetailRequest.swift
//  ProductSearchApp
//
//  Created by Elliot on 01-04-21.
//

import Foundation

class ItemDetailRequest: APIRequest {
    var method: Type
    var path: String
    var parameters: [String : String]?
    var headers: [String : String]?
    
    init(itemId: String) {
        method = .GET
        path = "/items/\(itemId)"
        parameters = [:]
        headers = [:]
    }
}
