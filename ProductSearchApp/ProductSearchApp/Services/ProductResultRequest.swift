//
//  ProductResultRequest.swift
//  ProductSearchApp
//
//  Created by Elliot on 30-03-21.
//

import Foundation

class ProductResultRequest: APIRequest {
    var method: Type = Type.GET
    var path: String = "sites/MLC/search"
    var parameters: [String : String] = ["q": "zapatillas%20niña"]
    var headers: [String : String] = [:]
}
