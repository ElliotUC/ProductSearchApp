//
//  ProductResultService.swift
//  ProductSearchApp
//
//  Created by Elliot on 30-03-21.
//

import RxSwift

protocol ProductResultServiceProtocol {
    func fetchProducts(searchItems by: String, offset: Int) -> Single<ProductResult>
}

class ProductResultService: ProductResultServiceProtocol {
    private let apiClient: APIClient
    
    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
    
    func fetchProducts(searchItems by: String, offset: Int) -> Single<ProductResult> {
        return apiClient.send(apiRequest: ProductResultRequest(searchItems: by, offset: offset))
    }
}
