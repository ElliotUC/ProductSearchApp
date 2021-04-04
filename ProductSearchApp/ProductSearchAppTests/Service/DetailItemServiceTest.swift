//
//  DetailItemServiceTest.swift
//  ProductSearchAppTests
//
//  Created by Elliot on 04-04-21.
//

import XCTest
import OHHTTPStubs
import RxBlocking

@testable import ProductSearchApp

class DetailItemServiceTest: XCTestCase {
    
    var detailItemService: DetailItemService!
    
    override func setUp() {
        super.setUp()
        HTTPStubs.setEnabled(true)
        detailItemService = DetailItemService(apiClient: APIClient())
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
        
        let result = try detailItemService.getItem(itemId: "MLC584674107").toBlocking().first()!
        XCTAssertNotNil(result)
    }
}
