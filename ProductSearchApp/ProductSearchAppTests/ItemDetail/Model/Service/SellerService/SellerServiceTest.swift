//
//  SellerServiceTest.swift
//  ProductSearchAppTests
//
//  Created by Elliot on 04-04-21.
//

import XCTest
import OHHTTPStubs
import RxBlocking

@testable import ProductSearchApp

class SellerServiceTest: XCTestCase {
    
    var sellerService: SellerService!
    
    override func setUp() {
        HTTPStubs.setEnabled(true)
        sellerService = SellerService(apiClient: APIClient())
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testShouldReturnResultData() throws {
        stub(condition: isHost("mercadolibre.com")) { _ in
            let stubsPath = OHPathForFile("API/JSON/seller.json", type(of: self))
            return fixture(filePath: stubsPath!, headers: ["Content-Type": "application/json"])
        }
        
        let result = try sellerService.getSeller(sellerId: "570184485") .toBlocking().first()!
        XCTAssertNotNil(result)
    }
    
}
