//
//  ViewControllerTest.swift
//  ProductSearchAppTests
//
//  Created by Elliot on 03-04-21.
//

import Foundation
import XCTest

@testable import ProductSearchApp

class ViewControllerTest: XCTestCase {
    
    var itemViewModel: [ProductViewModel]!
    var viewController: ViewController!
    var viewModel: ProductResultListViewModel!
    
    var coordinator: CoordinatorMock!
    
    override func setUp() {
        super.setUp()
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        coordinator = CoordinatorMock(window: window)
    }
    
    override class func tearDown() {
        super.tearDown()
    }
    
    func testShouldInstantiateSuccessful() {
        viewModel = ProductResultListViewModel(productResultService: ProductResultServiceMock())
        viewController = ViewController.instantiate(viewModel: viewModel, coordinator: coordinator)
        
        XCTAssertNotNil(viewController)
    }
    
    func testShouldShowProductResultList() {
        let expectation = XCTestExpectation(description: "should load")
        viewModel = ProductResultListViewModel(productResultService: ProductResultServiceMock())
        viewController = ViewController.instantiate(viewModel: viewModel, coordinator: coordinator)
        
        let searchBar = UISearchBar(frame: CGRect.zero)
        searchBar.text = "zapatillas"
        
        _ = viewController.view
        viewController.searchBarSearchButtonClicked(searchBar)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            XCTAssertTrue(self.viewController.tableView.visibleCells.count == ProductResultServiceMock().productResult.results.count)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 10.0)
    }
}
