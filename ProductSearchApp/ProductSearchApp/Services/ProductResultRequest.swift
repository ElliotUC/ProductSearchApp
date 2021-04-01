//
//  ProductResultRequest.swift
//  ProductSearchApp
//
//  Created by Elliot on 30-03-21.
//

import Foundation

class ProductResultRequest: APIRequest {
    var method: Type
    var path: String
    var parameters: [String : String]?
    var headers: [String : String]?
    
    init(searchProductsBy: String) {
        method = Type.GET
        path = "sites/MLC/search"
        parameters = ["q": searchProductsBy]
    }
}
