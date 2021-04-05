//
//  ItemResultServiceMock.swift
//  ProductSearchAppTests
//
//  Created by Elliot on 03-04-21.
//

import Foundation
import RxSwift

@testable import ProductSearchApp

class ItemResultServiceMock: ItemResultServiceProtocol {
    
    let itemResult: ItemResult!
    
    init() {
        itemResult = ItemResultMock().getItemResultMock()
    }
    
    func fetchItems(searchItems by: String, offset: Int) -> Single<ItemResult> {
        return Single.just(self.itemResult)
    }
}
