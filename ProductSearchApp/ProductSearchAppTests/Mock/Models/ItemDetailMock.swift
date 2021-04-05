//
//  ItemDetailMock.swift
//  ProductSearchAppTests
//
//  Created by Elliot on 04-04-21.
//

import Foundation

@testable import ProductSearchApp

class ItemDetailMock {
    
    private var itemDetail: ItemDetail!
    
    init() {
        let picture = Picture(url: "https://http2.mlstatic.com/D_728098-MLA44156141034_112020-I.jpg", secureUrl: "https://http2.mlstatic.com/D_728098-MLA44156141034_112020-I.jpg")
        
        itemDetail = ItemDetail(id: "", sellerId: 570184485, title: "Tableta Gráfica Huion H320m", price: 51128, thumbnail: "https://http2.mlstatic.com/D_659809-MLM32546693101_102019-I.jpg", condition: "new", warranty: "new", availableQuantity: 10, soldQuantity: 10, pictures: [picture])
    }
    
    func itemDetailMock() -> ItemDetail {
        return itemDetail
    }
    
}
