//
//  ItemViewModelTest.swift
//  ProductSearchAppTests
//
//  Created by Elliot on 04-04-21.
//

import XCTest

@testable import ProductSearchApp

class ItemViewModelTest: XCTestCase {
    
    var item: Item!
    var itemViewModel: ItemViewModel!
    
    override func setUp() {
        super.setUp()
        
        let installments = Installments(quantity: 6, amount: 1000, rate: 0)
        let shipping = Shipping(freeShipping: false)
        item = Item(id: "", title: "Zapatilla niña", price: 12000, thumbnail: "https://http2.mlstatic.com/D_922057-MLM41495056064_042020-O.jpg", installments: installments, shipping: shipping, originalPrice: 1000)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testShouldValidateDataProductViewmodel() {
        itemViewModel = ItemViewModel(item: item)
        XCTAssertEqual("Zapatilla niña", itemViewModel.displayTitle)
        XCTAssertEqual("$ 12.000", itemViewModel.displayPrice)
        XCTAssertEqual("$ 1.000", itemViewModel.displayOriginalPrice)
        XCTAssertEqual("6x $ 1.000 sin interés", itemViewModel.displayInstallments)
        XCTAssertEqual("https://http2.mlstatic.com/D_922057-MLM41495056064_042020-O.jpg", itemViewModel.displayImageUrl?.absoluteString)
    }
}
