//
//  ProductViewModelTest.swift
//  ProductSearchAppTests
//
//  Created by Elliot on 04-04-21.
//

import XCTest

@testable import ProductSearchApp

class ProductViewModelTest: XCTestCase {
    
    var product: Product!
    var productViewModel: ProductViewModel!
    
    override func setUp() {
        super.setUp()
        
        let installments = Installments(quantity: 6, amount: 1000, rate: 0)
        let shipping = Shipping(freeShipping: false)
        product = Product(id: "", title: "Zapatilla niña", price: 12000, thumbnail: "https://http2.mlstatic.com/D_922057-MLM41495056064_042020-O.jpg", installments: installments, shipping: shipping, originalPrice: 1000)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testShouldValidateDataProductViewmodel() {
        productViewModel = ProductViewModel(product: product)
        XCTAssertEqual("Zapatilla niña", productViewModel.displayTitle)
        XCTAssertEqual("$ 12.000", productViewModel.displayPrice)
        XCTAssertEqual("$ 1.000", productViewModel.displayOriginalPrice)
        XCTAssertEqual("6x $ 1.000 sin interés", productViewModel.displayInstallments)
        XCTAssertEqual("https://http2.mlstatic.com/D_922057-MLM41495056064_042020-O.jpg", productViewModel.displayImageUrl?.absoluteString)
        
    }
}
