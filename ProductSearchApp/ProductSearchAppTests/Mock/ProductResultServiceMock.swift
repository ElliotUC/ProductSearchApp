//
//  ProductResultServiceMock.swift
//  ProductSearchAppTests
//
//  Created by Elliot on 03-04-21.
//

import Foundation
import RxSwift

@testable import ProductSearchApp

class ProductResultServiceMock: ProductResultServiceProtocol {
    
    let productResult: ProductResult!
    
    init() {
        let paging = Paging(total: 0, primaryResults: 0, offset: 0, limit: 0)
        let installments = Installments(quantity: 0, amount: 0, rate: 0)
        let shipping = Shipping(freeShipping: false)
        let product = Product(id: "", title: "Zapatilla niña", price: 12000, thumbnail: "https://http2.mlstatic.com/D_922057-MLM41495056064_042020-O.jpg", installments: installments, shipping: shipping, originalPrice: 1000)
        productResult = ProductResult(query: "", paging: paging, results: [product])
    }
    
    func fetchProducts(searchItems by: String, offset: Int) -> Single<ProductResult> {
        return Single.just(self.productResult)
    }
}
