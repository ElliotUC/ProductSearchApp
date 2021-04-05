//
//  APIRequestTest.swift
//  ProductSearchAppTests
//
//  Created by Elliot on 04-04-21.
//

import XCTest

@testable import ProductSearchApp

class APIRequestTest: XCTestCase {
    
    var apiRequest: APIRequest!

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }
    
    func testShouldReturnURLRequestForProductResultRequest() {
        apiRequest = ItemResultRequest(searchItems: "t shirts", offset: 0)
        let url = apiRequest.request(with: URL(string: "https://api.mercadolibre.com/")!)
        XCTAssertNotNil(url)
    }
    
    func testShouldReturnURLRequestForDetailItemRequest() {
        apiRequest = ItemDetailRequest(itemId: "MLC584674107")
        let url = apiRequest.request(with: URL(string: "https://api.mercadolibre.com/")!)
        XCTAssertNotNil(url)
    }
}
