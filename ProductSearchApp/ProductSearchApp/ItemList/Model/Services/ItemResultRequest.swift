//
//  ItemResultRequest.swift
//  ProductSearchApp
//
//  Created by Elliot on 30-03-21.
//

import Foundation

class ItemResultRequest: APIRequest {
    var method: Type
    var path: String
    var parameters: [String : String]?
    var headers: [String : String]?
    
    init(searchItems by: String, offset: Int) {
        method = Type.GET
        path = "sites/MLC/search"
        parameters = ["q": by, "offset": String(offset)]
    }
}
