//
//  ItemResultListViewModelTest.swift
//  ProductSearchAppTests
//
//  Created by Elliot on 04-04-21.
//

import XCTest
import RxBlocking

@testable import ProductSearchApp

class ItemResultListViewModelTest: XCTestCase {
    
    var itemResultListViewModel: ItemResultListViewModel!
    
    override func setUp() {
        super.setUp()
        itemResultListViewModel = ItemResultListViewModel(itemResultService: ItemResultServiceMock())
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testShouldReturnFetchProductViewModel() throws {
        let result = try itemResultListViewModel.fetchItemsViewModel(searchItems: "Zapatilla niña").toBlocking().first()
        XCTAssertNotNil(result)
        XCTAssertEqual("Zapatilla niña", (result?.first?.displayTitle)!)
    }
}
