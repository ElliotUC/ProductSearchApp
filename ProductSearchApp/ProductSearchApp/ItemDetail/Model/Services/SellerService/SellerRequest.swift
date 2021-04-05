//
//  SellerRequest.swift
//  ProductSearchApp
//
//  Created by Elliot on 04-04-21.
//

import Foundation

class SellerRequest: APIRequest {
    
    var method: Type
    var path: String
    var parameters: [String : String]?
    var headers: [String : String]?
    
    init(sellerId: String) {
        method = .GET
        path = "\(ConstantsAPI.searchSeller)\(sellerId)"
        parameters = [:]
        headers = [:]
    }
}
