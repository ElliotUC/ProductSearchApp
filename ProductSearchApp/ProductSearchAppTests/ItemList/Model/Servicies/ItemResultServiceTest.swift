//
//  ItemResultServiceTest.swift
//  ProductSearchAppTests
//
//  Created by Elliot on 04-04-21.
//

import XCTest
import OHHTTPStubs
import RxBlocking

@testable import ProductSearchApp

class ItemResultServiceTest: XCTestCase {
    
    var itemResultService: ItemResultService!
    
    override func setUp() {
        super.setUp()
        HTTPStubs.setEnabled(true)
        itemResultService = ItemResultService(apiClient: APIClient())
    }
    
    override func tearDown() {
        super.tearDown()
        HTTPStubs.removeAllStubs()
    }
    
    func testShouldReturnResultData() throws {
        stub(condition: isHost("mercadolibre.com")) { _ in
            let stubsPath = OHPathForFile("API/JSON/search.json", type(of: self))
            return fixture(filePath: stubsPath!, headers: ["Content-Type": "application/json"])
        }
        
        let result = try itemResultService.fetchItems(searchItems: "t shirts", offset: 0).toBlocking().first()!
        XCTAssertNotNil(result)
    }
}
