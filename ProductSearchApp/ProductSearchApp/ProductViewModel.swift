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
    
    var displayTitle: String {
        return product.title
    }
    
    var displayPrice: String {
        return "$ \(String(product.price))"
    }
    
    var displayInstallments: String {
        let installments = product.installments
        return  "\(String(installments.quantity))x $" +                             "\(String(installments.amount))" +
                "\(installments.rate == 0 ? "sin interés": "")"
    }
    
    var displayShipping: String {
        let shipping = product.shipping
        return "\(shipping.freeShipping ? "Envío gratis" : "")"
    }
    
    var displayImage: UIImage {
        let url = URL(string: product.thumbnail)!
        guard let imageData = try? Data(contentsOf: url) else { return UIImage() }
        
        return UIImage(data: imageData)!
    }
    
    init(product: Product) {
        self.product = product
    }
}
