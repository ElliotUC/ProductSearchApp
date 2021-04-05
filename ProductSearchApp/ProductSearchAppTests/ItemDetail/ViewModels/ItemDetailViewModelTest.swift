//
//  ItemDetailViewModelTest.swift
//  ProductSearchAppTests
//
//  Created by Elliot on 04-04-21.
//

import XCTest

@testable import ProductSearchApp

class ItemDetailViewModelTest: XCTestCase {
    
    var picture: Picture!
    var itemDetailViewModel: ItemDetailViewModel!
    
    override func setUp() {
        super.setUp()
    }
    
    func testShouldValidateItemViewmodel() {
        itemDetailViewModel = ItemDetailViewModel(itemDetail: ItemDetailMock().itemDetailMock())
          
        XCTAssertEqual("Tableta Gráfica Huion H320m", itemDetailViewModel.displayTitle)
        XCTAssertEqual("$ 51.128", itemDetailViewModel.displayPrice)
        XCTAssertEqual("https://http2.mlstatic.com/D_728098-MLA44156141034_112020-I.jpg", itemDetailViewModel.displayImages.first?.absoluteString)
    }
}
