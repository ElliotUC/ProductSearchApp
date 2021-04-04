//
//  ProductResultServiceTest.swift
//  ProductSearchAppTests
//
//  Created by Elliot on 04-04-21.
//

import XCTest
import OHHTTPStubs
import RxBlocking

@testable import ProductSearchApp

class ProductResultServiceTest: XCTestCase {
    
    var productResultService: ProductResultService!
    
    override func setUp() {
        super.setUp()
        HTTPStubs.setEnabled(true)
        productResultService = ProductResultService(apiClient: APIClient())
    }
    
    override func tearDown() {
        super.tearDown()
        HTTPStubs.removeAllStubs()
    }
    
    func testShouldReturnResultData() throws {
        stub(condition: isHost("mercadolibre.com")) { _ in
            let stubsPath = OHPathForFile("JSON/search.json", type(of: self))
            return fixture(filePath: stubsPath!, headers: ["Content-Type": "application/json"])
        }
        
        let result = try productResultService.fetchProducts(searchItems: "t shirts", offset: 0).toBlocking().first()!
        XCTAssertNotNil(result)
    }
}
