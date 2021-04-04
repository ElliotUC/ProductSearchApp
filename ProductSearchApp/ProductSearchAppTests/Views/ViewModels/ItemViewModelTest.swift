//
//  ItemViewModelTest.swift
//  ProductSearchAppTests
//
//  Created by Elliot on 04-04-21.
//

import XCTest

@testable import ProductSearchApp

class ItemViewModelTest: XCTestCase {
    
    var picture: Picture!
    var itemViewModel: ItemViewModel!
    
    override func setUp() {
        super.setUp()
        
        picture = Picture(url: "https://http2.mlstatic.com/D_728098-MLA44156141034_112020-I.jpg", secureUrl: "https://http2.mlstatic.com/D_728098-MLA44156141034_112020-I.jpg")
    }
    
    func testShouldValidateItemViewmodel() {
        itemViewModel = ItemViewModel(detailItem: DetailProduct(id: "", title: "The beatles", price: 1000, thumbnail: "https://http2.mlstatic.com/D_728098-MLA44156141034_112020-I.jpg", condition: "new", pictures: [picture]))
        
        XCTAssertEqual("The beatles", itemViewModel.displayTitle)
        XCTAssertEqual("$ 1.000", itemViewModel.displayPrice)
        XCTAssertEqual("https://http2.mlstatic.com/D_728098-MLA44156141034_112020-I.jpg", itemViewModel.displayImages.first?.absoluteString)
    }
}
