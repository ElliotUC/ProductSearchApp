//
//  ItemViewModel.swift
//  ProductSearchApp
//
//  Created by Elliot on 30-03-21.
//

import Foundation
import UIKit

struct ItemViewModel {
    
    private let item: Item
    
    var itemId: String {
        return item.id
    }
    
    var displayTitle: String {
        return item.title
    }
    
    var displayPrice: String {
        let total = Converter.convertToDecimal(item.price)
        return "$ \(total)"
    }
    
    var displayOriginalPrice: String {
        if let originalPrice = item.originalPrice {
            let total = Converter.convertToDecimal(originalPrice)
            return "$ \(total)"
        }
        
        return ""
    }
    
    var displayInstallments: String {
        let installments = item.installments
        let total = Converter.convertToDecimal(installments.amount)
        
        return  "\(String(installments.quantity))x $ " +                         "\(total)" +
                "\(installments.rate == 0 ? " sin interés": "")"
    }
    
    var displayShipping: String {
        let shipping = item.shipping
        return "\(shipping.freeShipping ? "Envío gratis" : "")"
    }
    
    var displayImageUrl: URL? {
        return URL(string: item.thumbnail)
    }
    
    init(item: Item) {
        self.item = item
    }
}
