//
//  ItemDetailServiceMock.swift
//  ProductSearchAppTests
//
//  Created by Elliot on 04-04-21.
//

import Foundation
import RxSwift

@testable import ProductSearchApp

class ItemDetailServiceMock: ItemDetailServiceProtocol {
    
    var itemDetail: ItemDetail!
    
    init() {
        itemDetail = ItemDetailMock().itemDetailMock()
    }

    func getItemDetail(itemId: String) -> Single<ItemDetail> {
        return Single.just(itemDetail)
    }

}
