//
//  ItemDetailViewControllerTest.swift
//  ProductSearchAppTests
//
//  Created by Elliot on 04-04-21.
//

import Foundation
import XCTest

@testable import ProductSearchApp

class ItemDetailViewControllerTest: XCTestCase {
    
    var itemViewModel: ItemViewModel!
    var itemDetailViewController: ItemDetailViewController!
    
    let window = UIWindow(frame: UIScreen.main.bounds)
    
    override func setUp() {
        super.setUp()
    }
    
    override class func tearDown() {
        super.tearDown()
    }
    
    func testShouldInstantiateSuccessful() {
        itemViewModel = ItemViewModel(item: ItemMock().getItemMock())
        itemDetailViewController = ItemDetailViewController.instantiate(itemViewModel: itemViewModel, itemDetailResultViewModel: ItemDetailResultViewModel(itemDetailService: ItemDetailServiceMock()), sellerResultViewModel: SellerResultViewModel(sellerService: SellerServiceMock()))

        XCTAssertNotNil(itemDetailViewController)
    }
    
    func testShouldShowDataInView() {
        itemViewModel = ItemViewModel(item: ItemMock().getItemMock())
        itemDetailViewController = ItemDetailViewController.instantiate(itemViewModel: itemViewModel, itemDetailResultViewModel: ItemDetailResultViewModel(itemDetailService: ItemDetailServiceMock()), sellerResultViewModel: SellerResultViewModel(sellerService: SellerServiceMock()))
        
        _ = itemDetailViewController.view
        
        XCTAssertEqual(itemDetailViewController.conditionItem.text, "Nuevo")
        XCTAssertEqual(itemDetailViewController.titleItem.text, "Zapatilla niña")
        XCTAssertEqual(itemDetailViewController.horizontalScrollView.carouselDataSource?.numberOfImagesInSection(), 1)
        XCTAssertEqual(itemDetailViewController.originalPrice.text, "$ 1.000")
        XCTAssertEqual(itemDetailViewController.priceItem.text, "$ 12.000")
        XCTAssertEqual(itemDetailViewController.sellerNickName.text, "HUIONCL 1")
    }
}
