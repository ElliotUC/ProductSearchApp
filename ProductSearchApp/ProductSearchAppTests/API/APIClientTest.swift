//
//  APIClientTest.swift
//  ProductSearchAppTests
//
//  Created by Elliot on 04-04-21.
//

import XCTest
import RxBlocking
import OHHTTPStubs

@testable import ProductSearchApp

class APIClientTest: XCTestCase {
    
    var apiClient: APIClient!
    
    override func setUp() {
        super.setUp()
        apiClient = APIClient()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testShouldReturnSearchJson() throws {
        stub(condition: isHost("mercadolibre.com")) { _ in
            let stubsPath = OHPathForFile("JSON/search.json", type(of: self))
            return fixture(filePath: stubsPath!, headers: ["Content-Type": "application/json"])
        }
        
        let productResult: ProductResult = try apiClient.send(apiRequest: ProductResultRequest(searchItems: "search", offset: 0)).toBlocking().first()!
        XCTAssertNotNil(productResult)
    }
    
    func testShouldReturnItemJson() throws {
        stub(condition: isHost("mercadolibre.com")) { _ in
            let stubsPath = OHPathForFile("JSON/item.json", type(of: self))
            return fixture(filePath: stubsPath!, headers: ["Content-Type": "application/json"])
        }
        
        let detailProduct: DetailProduct = try apiClient.send(apiRequest: DetailItemRequest(itemId: "MLC584674107")).toBlocking().first()!
        XCTAssertNotNil(detailProduct)
    }
}
