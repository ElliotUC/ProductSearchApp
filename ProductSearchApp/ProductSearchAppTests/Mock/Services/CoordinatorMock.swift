//
//  CoordinatorMock.swift
//  ProductSearchAppTests
//
//  Created by Elliot on 03-04-21.
//

import Foundation

@testable import ProductSearchApp

class CoordinatorMock: MainCoordinator {
    
    var isStartCalled = false
    var isShowDetail = false

    override func start() {
        isStartCalled = true
    }

    override func showItemDetail(itemviewModel: ItemViewModel) {
        isShowDetail = true
    }
}
