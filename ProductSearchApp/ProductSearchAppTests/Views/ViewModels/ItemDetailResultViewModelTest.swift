//
//  ItemDetailResultViewModelTest.swift
//  ProductSearchAppTests
//
//  Created by Elliot on 04-04-21.
//

import XCTest
import RxBlocking

@testable import ProductSearchApp

class ItemDetailResultViewModelTest: XCTestCase {
    
    var itemDetailResultViewModel: ItemDetailResultViewModel!
    
    override func setUp() {
        super.setUp()
        itemDetailResultViewModel = ItemDetailResultViewModel(itemDetailService: ItemDetailServiceMock())
    }
    
    func testShouldReturnGetItemViewModel() throws {
        let result = try itemDetailResultViewModel.getItemDetailViewModel(itemId: "MLC584674107") .toBlocking().first()
        XCTAssertNotNil(result)
        XCTAssertEqual("https://http2.mlstatic.com/D_922057-MLM41495056064_042020-O.jpg", result?.displayImages.first?.absoluteString)
    }
}
