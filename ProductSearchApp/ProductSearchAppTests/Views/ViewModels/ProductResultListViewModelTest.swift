//
//  ProductResultListViewModelTest.swift
//  ProductSearchAppTests
//
//  Created by Elliot on 04-04-21.
//

import XCTest
import RxBlocking

@testable import ProductSearchApp

class ProductResultListViewModelTest: XCTestCase {
    
    var productResultListViewModel: ProductResultListViewModel!
    
    override func setUp() {
        super.setUp()
        productResultListViewModel = ProductResultListViewModel(productResultService: ProductResultServiceMock())
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testShouldReturnFetchProductViewModel() throws {
        let result = try productResultListViewModel.fetchProductViewModel(searchItems: "Zapatilla niña").toBlocking().first()
        XCTAssertNotNil(result)
        XCTAssertEqual("Zapatilla niña", (result?.first?.displayTitle)!)
    }
}
