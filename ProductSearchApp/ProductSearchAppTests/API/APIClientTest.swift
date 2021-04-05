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
        
        let itemResult: ItemResult = try apiClient.send(apiRequest: ItemResultRequest(searchItems: "search", offset: 0)).toBlocking().first()!
        XCTAssertNotNil(itemResult)
    }
    
    func testShouldReturnItemJson() throws {
        stub(condition: isHost("mercadolibre.com")) { _ in
            let stubsPath = OHPathForFile("JSON/item.json", type(of: self))
            return fixture(filePath: stubsPath!, headers: ["Content-Type": "application/json"])
        }
        
        let itemDetail: ItemDetail = try apiClient.send(apiRequest: ItemDetailRequest(itemId: "MLC584674107")).toBlocking().first()!
        XCTAssertNotNil(itemDetail)
    }
    
    func testShouldReturnSearchEmptyData() throws {
        stub(condition: isHost("mercadolibre.com")) { _ in
            let stubsPath = OHPathForFile("", type(of: self))
            return fixture(filePath: stubsPath!, headers: ["Content-Type": "application/json"])
        }
        
        let itemResult: ItemResult = try apiClient.send(apiRequest: ItemResultRequest(searchItems: "search", offset: 0)).toBlocking().first()!
        XCTAssertNotNil(itemResult)
    }

}
