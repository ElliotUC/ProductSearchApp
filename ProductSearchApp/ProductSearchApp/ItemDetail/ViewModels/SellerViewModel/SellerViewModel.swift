//
//  SellerViewModel.swift
//  ProductSearchApp
//
//  Created by Elliot on 04-04-21.
//

import Foundation


struct SellerViewModel {
    
    private let seller: Seller
    
    func displaySeller() -> String {
        return seller.nickname
    }
    
    init(seller: Seller) {
        self.seller = seller
    }
}
