//
//  ItemViewControllerTest.swift
//  ProductSearchAppTests
//
//  Created by Elliot on 03-04-21.
//

import Foundation
import XCTest

@testable import ProductSearchApp

class ItemViewControllerTest: XCTestCase {
    
    var itemsViewModel: [ItemViewModel]!
    var itemViewController: ItemViewController!
    var itemResultListviewModel: ItemResultListViewModel!
    
    let window = UIWindow(frame: UIScreen.main.bounds)
    
    override func setUp() {
        super.setUp()
    }
    
    override class func tearDown() {
        super.tearDown()
    }
    
    func testShouldInstantiateSuccessful() {
        let coordinator = CoordinatorMock(window: window)
        itemResultListviewModel = ItemResultListViewModel(itemResultService: ItemResultServiceMock())
        itemViewController = ItemViewController.instantiate(viewModel: itemResultListviewModel, coordinator: coordinator)
        
        XCTAssertNotNil(itemViewController)
    }
    
    func testShouldShowProductResultList() {
        let coordinator = CoordinatorMock(window: window)
        let expectation = XCTestExpectation(description: "should load")
        itemResultListviewModel = ItemResultListViewModel(itemResultService: ItemResultServiceMock())
        itemViewController = ItemViewController.instantiate(viewModel: itemResultListviewModel, coordinator: coordinator)
        
        let searchBar = UISearchBar(frame: CGRect.zero)
        searchBar.text = "zapatillas"
        
        _ = itemViewController.view
        itemViewController.searchBarSearchButtonClicked(searchBar)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            XCTAssertTrue(self.itemViewController.tableView.visibleCells.count == ItemResultServiceMock().itemResult.results.count)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testShouldShowDetailProductWhenTableViewItemIsClicked() {
        let expectationLoad = XCTestExpectation(description: "shoul load")
        let expectation = XCTestExpectation(description: "should push")
        
        let coordinator = MainCoordinator(window: window)
        itemResultListviewModel = ItemResultListViewModel(itemResultService: ItemResultServiceMock())
        itemViewController = ItemViewController.instantiate(viewModel: itemResultListviewModel, coordinator: coordinator)
        
        coordinator.navigationController = UINavigationController(rootViewController: itemViewController)
        
        let searchBar = UISearchBar(frame: CGRect.zero)
        searchBar.text = "zapatillas"
        
        _ = itemViewController.view
        itemViewController.searchBarSearchButtonClicked(searchBar)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            self.itemViewController.tableView.delegate!.tableView?(self.itemViewController.tableView, didSelectRowAt: IndexPath(item: 0, section: 0))
            
            expectationLoad.fulfill()
        }
        wait(for: [expectationLoad], timeout: 10.0)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            XCTAssertTrue(coordinator.navigationController.visibleViewController is ItemDetailViewController)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }
}
