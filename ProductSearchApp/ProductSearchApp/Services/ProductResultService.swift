//
//  ProductResultService.swift
//  ProductSearchApp
//
//  Created by Elliot on 30-03-21.
//

import RxSwift

protocol ProductResultServiceProtocol {
    func fetchProducts() -> Observable<ProductResult>
}

class ProductResultService: ProductResultServiceProtocol {
    func fetchProducts() -> Observable<ProductResult> {
        APIClient().send(apiRequest: ProductResultRequest())
    }
}
