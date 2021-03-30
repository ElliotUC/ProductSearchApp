//
//  ProductResultListViewModel.swift
//  ProductSearchApp
//
//  Created by Elliot on 30-03-21.
//

import Foundation
import RxSwift

final class ProductResultListViewModel {
    
    private let productResultService: ProductResultServiceProtocol
    
    init(productResultService: ProductResultServiceProtocol = ProductResultService()) {
        self.productResultService = productResultService
    }
    
    func fetchProductViewModel() -> Observable<[ProductViewModel]> {
        productResultService.fetchProducts().map { $0.results.map {
            ProductViewModel(product: $0)}
        }
    }
}
