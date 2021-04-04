//
//  ItemDetailServiceTest.swift
//  ProductSearchAppTests
//
//  Created by Elliot on 04-04-21.
//

import XCTest
import OHHTTPStubs
import RxBlocking

@testable import ProductSearchApp

class ItemDetailServiceTest: XCTestCase {
    
    var itemDetailService: ItemDetailService!
    
    override func setUp() {
        super.setUp()
        HTTPStubs.setEnabled(true)
        itemDetailService = ItemDetailService(apiClient: APIClient())
    }
    
    override func tearDown() {
        super.tearDown()
        HTTPStubs.removeAllStubs()
    }
    
    func testShouldReturnResultData() throws {
        stub(condition: isHost("mercadolibre.com")) { _ in
            let stubsPath = OHPathForFile("JSON/item.json", type(of: self))
            return fixture(filePath: stubsPath!, headers: ["Content-Type": "application/json"])
        }
        
        let result = try itemDetailService.getItemDetail(itemId: "MLC584674107").toBlocking().first()!
        XCTAssertNotNil(result)
    }
}
