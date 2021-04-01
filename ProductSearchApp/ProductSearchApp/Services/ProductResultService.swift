//
//  ProductResultService.swift
//  ProductSearchApp
//
//  Created by Elliot on 30-03-21.
//

import RxSwift

protocol ProductResultServiceProtocol {
    func fetchProducts(searchProductsBy: String) -> Observable<ProductResult>
}

class ProductResultService: ProductResultServiceProtocol {
    private let apiClient: APIClient
    
    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
    
    func fetchProducts(searchProductsBy: String) -> Observable<ProductResult> {
        apiClient.send(apiRequest: ProductResultRequest(searchProductsBy: searchProductsBy))
    }
}
