//
//  ItemMock.swift
//  ProductSearchAppTests
//
//  Created by Elliot on 04-04-21.
//

import Foundation

@testable import ProductSearchApp

class ItemMock {
    
    private var item: Item!
    
    init() {
        let installments = Installments(quantity: 6, amount: 1000, rate: 0)
        let shipping = Shipping(freeShipping: false)
        item = Item(id: "", title: "Zapatilla niña", price: 12000, thumbnail: "https://http2.mlstatic.com/D_922057-MLM41495056064_042020-O.jpg", installments: installments, shipping: shipping, originalPrice: 1000)
    }
    
    func getItemMock() -> Item {
        return item
    }
}
