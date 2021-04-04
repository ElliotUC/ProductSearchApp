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
    var productViewModel: ProductViewModel!
    var viewController: ViewController!
    var detailProductViewController: DetailProductViewController!
    
    override func setUp() {
        super.setUp()
        let window = UIWindow(frame: UIScreen.main.bounds)
        coordinator = MainCoordinator(window: window)
        
        let installments = Installments(quantity: 0, amount: 0, rate: 0)
        let shipping = Shipping(freeShipping: false)
        let product = Product(id: "", title: "Zapatilla niña", price: 12000, thumbnail: "https://http2.mlstatic.com/D_922057-MLM41495056064_042020-O.jpg", installments: installments, shipping: shipping, originalPrice: 1000)
        productViewModel = ProductViewModel(product: product)
        
        viewController = ViewController.instantiate(viewModel: ProductResultListViewModel(productResultService: ProductResultServiceMock()), coordinator: coordinator)
        
        detailProductViewController = DetailProductViewController.instantiate(productViewModel: productViewModel, itemResultViewModel: ItemResultViewModel(detailItemService: DetailItemServiceMock()))
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testStartViewController() {
        coordinator.start()
        XCTAssertTrue(viewController.classForCoder == ViewController.self)
    }
    
    func testShowDetailProductViewController() {
        coordinator.navigationController = UINavigationController(rootViewController: viewController)
        coordinator.showItemDetail(productviewModel: productViewModel)
        XCTAssertTrue(detailProductViewController.classForCoder == DetailProductViewController.self)
    }
}
