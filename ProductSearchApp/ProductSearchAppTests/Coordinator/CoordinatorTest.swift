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
        
        let installments = Installments(quantity: 0, amount: 0, rate: 0)
        let shipping = Shipping(freeShipping: false)
        let item = Item(id: "", title: "Zapatilla niña", price: 12000, thumbnail: "https://http2.mlstatic.com/D_922057-MLM41495056064_042020-O.jpg", installments: installments, shipping: shipping, originalPrice: 1000)
        itemViewModel = ItemViewModel(item: item)
        
        itemViewController = ItemViewController.instantiate(viewModel: ItemResultListViewModel(itemResultService: ItemResultServiceMock()), coordinator: coordinator)

        itemDetailViewController = ItemDetailViewController.instantiate(itemViewModel: itemViewModel, itemResultViewModel: ItemDetailResultViewModel(itemDetailService: ItemDetailServiceMock()))
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
