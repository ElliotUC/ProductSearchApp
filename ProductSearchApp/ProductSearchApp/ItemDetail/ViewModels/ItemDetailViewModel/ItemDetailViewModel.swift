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
    
    var displayCondition: String {
        return itemDetail.condition == "new" ? "Nuevo" : "Usado"
    }
    
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
    
    var displayAvailableQuantity: String {
        return " Cantidad disponibles: \(itemDetail.availableQuantity)"
    }
    
    var displaySoldQuantity: String {
        return " Cantidad vendidas: \(itemDetail.soldQuantity)"
    }
    
    var displayWarranty: String {
        if let warranty = itemDetail.warranty {
            return " \(warranty)"
        }
        
        return " Garantía: Sin garantía"
    }
    
    var sellerId: String {
        return "\(itemDetail.sellerId)"
    }
    
    init(itemDetail: ItemDetail) {
        self.itemDetail = itemDetail
    }
}
