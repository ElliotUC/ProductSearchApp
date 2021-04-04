//
//  ItemViewModel.swift
//  ProductSearchApp
//
//  Created by Elliot on 01-04-21.
//

import Foundation
import UIKit

struct ItemViewModel {
    
    private let detailItem: DetailProduct
    
    var displayTitle: String {
        return detailItem.title
    }
    
    var displayPrice: String {
        let total = Converter.convertToDecimal(detailItem.price)
        return "$ \(total)"
    }
    
    var displayImages: [URL] {
        var urls: [URL] = [URL]()
        _ = detailItem.pictures.map {
            let pictureUrl = $0.url != nil && $0.url != "" ? $0.url : $0.secureUrl
            let url = URL(string: pictureUrl!)
            urls.append(url!)
        }
        
        return urls
    }
    
    init(detailItem: DetailProduct) {
        self.detailItem = detailItem
    }
}
