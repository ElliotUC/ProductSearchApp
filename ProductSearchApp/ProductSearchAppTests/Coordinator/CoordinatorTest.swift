//
//  CoordinatorTest.swift
//  ProductSearchAppTests
//
//  Created by Elliot on 04-04-21.
//

import XCTest

@testable import ProductSearchApp

class CoordinatorTest: XCTestCase {
    
    var coordinator: MainCoordinator!
    var itemViewModel: ItemViewModel!
    var itemViewController: ItemViewController!
    var itemDetailViewController: ItemDetailViewController!
    
    override func setUp() {
        super.setUp()
        let window = UIWindow(frame: UIScreen.main.bounds)
        coordinator = MainCoordinator(window: window)

        itemViewModel = ItemViewModel(item: ItemMock().getItemMock())
        
        itemViewController = ItemViewController.instantiate(viewModel: ItemResultListViewModel(itemResultService: ItemResultServiceMock()), coordinator: coordinator)

        itemDetailViewController = ItemDetailViewController.instantiate(itemViewModel: itemViewModel, itemDetailResultViewModel: ItemDetailResultViewModel(itemDetailService: ItemDetailServiceMock()), sellerResultViewModel: SellerResultViewModel(sellerService: SellerServiceMock()))
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testStartViewController() {
        coordinator.start()
        XCTAssertTrue(itemViewController.classForCoder == ItemViewController.self)
    }
    
    func testShowDetailProductViewController() {
        coordinator.navigationController = UINavigationController(rootViewController: itemViewController)
        coordinator.showItemDetail(itemviewModel: itemViewModel)
        XCTAssertTrue(itemDetailViewController.classForCoder == ItemDetailViewController.self)
    }
}
