//
//  ProductViewModel.swift
//  ProductSearchApp
//
//  Created by Elliot on 30-03-21.
//

import Foundation
import UIKit

struct ProductViewModel {
    
    private let product: Product
    
    var itemId: String {
        return product.id
    }
    
    var displayTitle: String {
        return product.title
    }
    
    var displayPrice: String {
        let total = Converter.convertToDecimal(product.price)
        return "$ \(total)"
    }
    
    var displayOriginalPrice: String {
        if let originalPrice = product.originalPrice {
            let total = Converter.convertToDecimal(originalPrice)
            return "$ \(total)"
        }
        
        return ""
    }
    
    var displayInstallments: String {
        let installments = product.installments
        let total = Converter.convertToDecimal(installments.amount)
        
        return  "\(String(installments.quantity))x $ " +                         "\(total)" +
                "\(installments.rate == 0 ? " sin interés": "")"
    }
    
    var displayShipping: String {
        let shipping = product.shipping
        return "\(shipping.freeShipping ? "Envío gratis" : "")"
    }
    
    var displayImageUrl: URL? {
        return URL(string: product.thumbnail)
    }
    
    init(product: Product) {
        self.product = product
    }
}
