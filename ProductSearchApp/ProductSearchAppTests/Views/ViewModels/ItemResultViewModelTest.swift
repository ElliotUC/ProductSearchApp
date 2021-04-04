//
//  ItemResultViewModelTest.swift
//  ProductSearchAppTests
//
//  Created by Elliot on 04-04-21.
//

import XCTest
import RxBlocking

@testable import ProductSearchApp

class ItemResultViewModelTest: XCTestCase {
    
    var itemResultViewModel: ItemResultViewModel!
    
    override func setUp() {
        super.setUp()
        itemResultViewModel = ItemResultViewModel(detailItemService: DetailItemServiceMock())
    }
    
    func testShouldReturnGetItemViewModel() throws {
        let result = try itemResultViewModel.getItemViewModel(itemId: "MLC584674107") .toBlocking().first()
        XCTAssertNotNil(result)
        XCTAssertEqual("https://http2.mlstatic.com/D_922057-MLM41495056064_042020-O.jpg", result?.displayImages.first?.absoluteString)
    }
}
