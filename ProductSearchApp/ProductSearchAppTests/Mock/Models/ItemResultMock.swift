//
//  ItemResultMock.swift
//  ProductSearchAppTests
//
//  Created by Elliot on 04-04-21.
//

import Foundation

@testable import ProductSearchApp

class ItemResultMock {
    
    private var itemResult: ItemResult!
    
    init() {
        let paging = Paging(total: 0, primaryResults: 0, offset: 0, limit: 0)
        let installments = Installments(quantity: 0, amount: 0, rate: 0)
        let shipping = Shipping(freeShipping: false)
        let item = Item(id: "", title: "Zapatilla niña", price: 12000, thumbnail: "https://http2.mlstatic.com/D_922057-MLM41495056064_042020-O.jpg", installments: installments, shipping: shipping, originalPrice: 1000)
        itemResult = ItemResult(query: "", paging: paging, results: [item])
    }
    
    func getItemResultMock() -> ItemResult {
        return itemResult
    }
}
