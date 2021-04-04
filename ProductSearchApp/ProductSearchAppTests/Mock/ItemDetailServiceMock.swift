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
        let picture = Picture(url: "https://http2.mlstatic.com/D_922057-MLM41495056064_042020-O.jpg", secureUrl: "https://http2.mlstatic.com/D_922057-MLM41495056064_042020-O.jpg")
        itemDetail = ItemDetail(id: "", title: "", price: 20, thumbnail: "https://http2.mlstatic.com/D_922057-MLM41495056064_042020-O.jpg", condition: "", pictures: [picture])
    }

    func getItemDetail(itemId: String) -> Single<ItemDetail> {
        return Single.just(itemDetail)
    }

}
