//
//  ItemDetailViewModel.swift
//  ProductSearchApp
//
//  Created by Elliot on 01-04-21.
//

import Foundation
import UIKit

struct ItemDetailViewModel {
    
    private let itemDetail: ItemDetail
    
    var displayTitle: String {
        return itemDetail.title
    }
    
    var displayPrice: String {
        let total = Converter.convertToDecimal(itemDetail.price)
        return "$ \(total)"
    }
    
    var displayImages: [URL] {
        var urls: [URL] = [URL]()
        _ = itemDetail.pictures.map {
            let pictureUrl = $0.url != nil && $0.url != "" ? $0.url : $0.secureUrl
            let url = URL(string: pictureUrl!)
            urls.append(url!)
        }
        
        return urls
    }
    
    init(itemDetail: ItemDetail) {
        self.itemDetail = itemDetail
    }
}
